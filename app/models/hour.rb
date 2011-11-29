class Hour < ActiveRecord::Base
  
  validates_presence_of :amount
  
  belongs_to :user
  belongs_to :project
  belongs_to :task
  belongs_to :work_category
  
  
  def project_name
    project.try(:name)
  end
  
  def project_name=(name)
    self.project = Project.find_by_name(name) if name.present?
  end
  
  
end
