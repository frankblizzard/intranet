class Profile < ActiveRecord::Base
  
  before_save :clear_empties
  
  validates_presence_of :user_id
  validates_uniqueness_of :user_id
  
  belongs_to :user
  
  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :avatar, :phone, :full_name, :website, :bio,
                  :birthday, :phone, :street, :zip, :city, :user_id, :job_description
  
  
  
private
  
  def clear_empties
    if self.city.blank?
      self.city = nil
    end
    if self.zip.blank?
      self.zip = nil
    end
    if self.street.blank?
      self.street = nil
    end
  end
  
end
