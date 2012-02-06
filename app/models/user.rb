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
  
  after_create :set_profile
  
  def set_profile
    self.build_profile(:user_id => self.id, :name => self.username)
  end
  
  def hours_today
    self.hours.where(:date => Date.today).to_a.sum { |hour| hour.amount }
  end
  
  # sum of all user hours in the given month
  def monthly_hours(year = Date.today.year, month = Date.today.month)
    month_hours = self.hours.by_month Date.new(year, month)
    month_hours.to_a.sum { |month_hour| month_hour.amount }
  end
  
  # sum of all holiday days in the given month
  def monthly_holidays(year = Date.today.year, month = Date.today.month)
    month_hours = self.hours.holiday.by_month Date.new(year, month)
    sum = month_hours.to_a.sum { |month_hour| month_hour.amount }
    (sum / 8).to_i
  end
  
  # sum of all ill days in the given month
  def monthly_illdays(year = Date.today.year, month = Date.today.month)
    month_hours = self.hours.ill.by_month Date.new(year, month)
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
    wdays = [0,6] #weekend days by numbers on week
    weekdays = (d1..d2).reject { |d| wdays.include? d.wday} #Day.wday number day in week
    todo_hours = weekdays.count * 8
    ist_hours = self.monthly_hours( year, month )
    if ist_hours > 0
      ist_hours - todo_hours
    else
      0
    end
  end
  
end
