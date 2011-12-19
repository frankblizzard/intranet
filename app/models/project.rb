class Project < ActiveRecord::Base
  
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
  
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  searchable do
    text :name, :boost => 5
    text :description, :boost => 2
    text :nr, :boost => 5
    text :client do
      client.name
    end
    text :tasks do 
      tasks.map(&:name)
    end
  end
  
  
  def name_number
    "#{self.nr} - #{self.name[0..24]}"
  end
  
  # helper function for jQuery tokenized input
  def profile_tokens=(ids)
    self.profile_ids = ids.split(',')
  end
  
end
