class Profile < ActiveRecord::Base
  
  validates_presence_of :user_id
  validates_uniqueness_of :user_id
  
  belongs_to :user
  
  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :avatar, :phone, :first_name, :last_name, :bio,
                  :birthday, :phone, :street, :zip, :city, :user_id
  
  
  
end
