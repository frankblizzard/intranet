class Review < ActiveRecord::Base
  
  validates_presence_of :name, :project_id
  
  belongs_to :project
  
  has_many :review_images, :dependent => :destroy
  
  has_many :review_assignments
  has_many :profiles, :through => :review_assignments, :class_name => "Profile", :source => :profile

  has_many :comments, :as => :commentable, :dependent => :destroy
  
  accepts_nested_attributes_for :review_images, :allow_destroy => true
  
  attr_reader :profile_tokens, :comments_count
  
  scope :running, where(:closed => false)
  scope :closed, where(:closed => true)
  
  # helper function for jQuery tokenized input
  def profile_tokens=(ids)
    self.profile_ids = ids.split(',')
  end
  
  def comments_count
    review_images.to_a.sum { |review_image| review_image.jc_comments.nil? ? 0 :  review_image.jc_comments.count }
  end
  
end
