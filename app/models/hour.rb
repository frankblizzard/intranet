class Hour < ActiveRecord::Base
  
  validates_presence_of :amount
  validates_presence_of :project_id
  validates_presence_of :user_id
  validates_presence_of :date
  
  belongs_to :user
  belongs_to :project
  belongs_to :task
  belongs_to :work_category
  
  scope :day, lambda {|day| where(:date => day) }
  
  def project_name
    project.try(:name)
  end
  
  def project_name=(name)
    self.project = Project.find_by_name(name) if name.present?
  end
  
  def percent_day
    daily_hours = 10
    percentage = self.amount * 100 / daily_hours
    percentage  
  end 
    
  def self.total_percent_day(user, date=Date.today)
    day_hours = Hour.where(:date => date, :user_id => user.id)
    day_hours.to_a.sum { |day_hour| day_hour.percent_day }
  end
  
  def self.number_of_entries(user, date=Date.today)
    Hour.where(:date => date, :user_id => user.id).count
  end
  
  
  
end
