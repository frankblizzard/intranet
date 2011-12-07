class Profile < ActiveRecord::Base
  
  before_save :clear_empties
  
  validates_presence_of :user_id
  validates_presence_of :name
  validates_uniqueness_of :user_id
  
  belongs_to :user
  
  has_many :assignments
  has_many :projects, :through => :assignments
  
  
  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :avatar, :phone, :name, :website, :bio,
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
