class Project < ActiveRecord::Base
  
  acts_as_birthday :deadline
  
  validates_presence_of :nr
  validates_presence_of :client_id
  validates_presence_of :name
  validates_uniqueness_of :nr
  
  belongs_to :client
  belongs_to :project_status
  
  has_many :assignments
  has_many :tasks, :dependent => :destroy
  has_many :profiles, :through => :assignments, :class_name => "Profile", :source => :profile  
  
  has_many :hours
  
  #attr_accessible :nr, :name, :client_id, :project_status_id, :hidden, :active, :description, :tasks_attributes, :profiles_attributes, :profile_tokens
  
  attr_reader :name_number, :profile_tokens
  
  scope :active, where(:active => '1')
  scope :visible, where(:hidden => '0')
  scope :design, where(:web => '0')
  scope :web, where(:web => '1')
  scope :in_progress, where(:project_status_id => '1')
  scope :future, :conditions => [' deadline >= ? ', Date.today ]
  scope :with_user, lambda { |user_id| joins(:assignments).where(:user_id => user_id) }
  scope :with_status, lambda { |status_id| where( :project_status_id => status_id ).order(:deadline) }
  scope :continous, where(:project_status_id => '2')
  scope :scheduled, where(:project_status_id => '4')
  
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  #searchable do
  #  integer :nr
  #  text :name_number, :boost => 5
  #  text :name, :boost => 4
  #  text :description, :boost => 2
  #  text :client do
  #    client.name
  #  end
  #  text :tasks do 
  #    tasks.map(&:name)
  #  end
  #end
  
  def self.search(search)  
    if search  
      where('name LIKE ? OR nr LIKE ?', "%#{search}%", "%#{search}%")  
    else  
      scoped  
    end  
  end
  
  def self.next_deadlines(profile)
    profile.projects.in_progress.order(:deadline)
  end

  def self.upcoming_projects(profile)
    profile.projects.scheduled.order(:deadline)
  end
  
  def self.continous_projects(profile)
    profile.projects.continous.order(:nr)
  end
  
  def name_number
    "#{self.nr} - #{self.name[0..24]}"
  end
  
  def sum_plan_hours
    tasks.to_a.sum { |task| task.plan_hours.nil? ? 0 :  task.plan_hours}
  end
  
  # helper function for jQuery tokenized input
  def profile_tokens=(ids)
    self.profile_ids = ids.split(',')
  end
  
  # gives total hours of project or, if a user is given, the total hours of this user on the project
  def total_hours(user=nil, extra = false)
    if user
      hours = self.hours.where(:user_id => user)
    else
      hours = self.hours
    end
    if extra
      hours = hours.where(:extra => true)
    end
    hours.to_a.sum { |hour| hour.amount }
  end
  
  # return an array of hours that a given user booked on this project
  def user_hours(user)
    hours = self.hours.where(:user_id => user).order(:date)
  end
  
  # returns a list of all user ids that booked hours on this project
  def project_users
    user_list = []
    self.hours.each do |h|
      user_list << h.user_id
    end
    user_list.uniq
  end
  
  protected
  
  def ensure_no_hours
    if self.hours.count > 0
      return false
    else
      return true
    end
  end

end
