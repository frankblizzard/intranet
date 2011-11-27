class Hour < ActiveRecord::Base
  
  validates_presence_of :amount
  
  belongs_to :user
  belongs_to :project
  belongs_to :task
  
  
  
end
