class JcComment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  
  # returns only the jc comments that are on a specific position
  scope :with_position, :conditions => ['x1 IS NOT NULL AND y1 IS NOT NULL AND w IS NOT NULL AND h IS NOT NULL']
  
  
end
