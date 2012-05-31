class Image < ActiveRecord::Base
  
  #attr_accessible :id, :project_id, :name, :source, :user_id, :size
  belongs_to :project
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :project_id
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  mount_uploader :source, ImgUploader
  
  #has_many :surveys, :dependent => :destroy
  #accepts_nested_attributes_for :surveys, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
end
