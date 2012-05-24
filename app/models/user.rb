class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  has_many :comments
  has_many :posts
  has_one  :profile
  has_many :bugs
  
  has_many :hours
  
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  
  
  after_create :set_profile, :set_client

  
  def set_profile
    self.build_profile(:user_id => self.id, :name => self.username, :in_company_since => Date.today - 1.day)
  end
  
  # set the default new registration to "client" role so nobody can just register and see all!
  def set_client
    self.profile.is_client = 1
    self.profile.save!
  end
  
  def hours_today
    self.hours.where(:date => Date.today).to_a.sum { |hour| hour.amount }
  end
  
  # sum of all user hours in the given month
  def monthly_hours(year = Date.today.year, month = Date.today.month)
    month_hours = hours.not_future.by_month Date.new(year, month)
    ist = month_hours.to_a.sum { |month_hour| month_hour.amount }
    comp = comp_time(year,month)
    ist - comp
  end
  
  # sum of all comp time per user per month
  def comp_time(year = Date.today.year, month = Date.today.month)
    comp_hours = hours.comp_time.by_month Date.new(year, month)
    comp_hours.to_a.sum { |comp_hours| comp_hours.amount }
  end  
  
  # sum of all holiday days in the given month
  def monthly_holidays(year = Date.today.year, month = Date.today.month)
    month_hours = hours.holiday.by_month Date.new(year, month)
    sum = month_hours.to_a.sum { |month_hour| month_hour.amount }
    (sum / 8).to_i
  end
  
  # sum of all ill days in the given month
  def monthly_illdays(year = Date.today.year, month = Date.today.month)
    month_hours = hours.ill.by_month Date.new(year, month)
    sum = month_hours.to_a.sum { |month_hour| month_hour.amount }
    (sum / 8).to_i
  end
  
  def workdays(month)
    d1 = Date.new( Time.now.year, month, 1) #first day of month\period
    d2 = Date.new( Time.now.year, month, -1) #end day of month\period
    wdays = [0,6] #weekend days by numbers on week
    weekdays = (d1..d2).reject { |d| wdays.include? d.wday} #Day.wday number day in week
  end

  def extra_hours(year, month)
    d1 = Date.new( year, month, 1) #first day of month\period
    d2 = Date.new( year, month, -1) #end day of month\period
    
    return 0 if d2 < profile.in_company_since
    
    d1 = profile.in_company_since if d1 < profile.in_company_since # check if date was before user joined company
    
    d2 = Date.today if d2 > Date.today # check if end of month is in future...
    
    wdays = [0,6] #weekend days by numbers on week
    weekdays = (d1..d2).reject { |d| wdays.include? d.wday} #Day.wday number day in week
    
    todo_hours = 0
    
    weekdays.each do |wd|
      case wd.wday
        when 1 #monday
           todo_hours += profile.time_mon
        when 2 #tuesday
           todo_hours += profile.time_tue
        when 3 #wednesday
           todo_hours += profile.time_wed
        when 4 #thursday
           todo_hours += profile.time_thu
        when 5 #friday
           todo_hours += profile.time_fri
        else
          break
      end
    end
    ist_hours = self.monthly_hours( year, month )
    if ist_hours > 0
      ist_hours - todo_hours
    else
      0
    end
  end
  
end
