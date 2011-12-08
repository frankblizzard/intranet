class Task < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :plan_hours
  
  belongs_to :project
  
end
