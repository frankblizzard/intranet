class Project < ActiveRecord::Base
  
  validates_presence_of :nr
  validates_presence_of :client_id
  validates_presence_of :name
  
  belongs_to :client
  belongs_to :project_status
  
  has_many :tasks
  
end
