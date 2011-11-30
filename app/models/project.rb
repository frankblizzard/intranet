class Project < ActiveRecord::Base
  
  validates_presence_of :nr
  validates_presence_of :client_id
  validates_presence_of :name
  
  belongs_to :client
  belongs_to :project_status
  
  has_many :tasks
  
  attr_accessible :nr, :name, :client_id, :project_status_id, :hidden, :active, :description
  
  attr_reader :name_number, :profile_tokens
  
  scope :active, where(:active => '1')
  scope :visible, where(:hidden => '0')
  
  def name_number
    "#{self.nr} - #{self.name}"
  end
  
  # helper function for jQuery tokenized input
  def profile_tokens=(ids)
    self.profile_ids = ids.split(',')
  end
  
end
