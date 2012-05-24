class Profile < ActiveRecord::Base
  
  acts_as_birthday :birthday
  
  before_save :clear_empties
  
  validates_presence_of :user_id
  validates_presence_of :name
  validates_uniqueness_of :user_id
  
  belongs_to :user
  belongs_to :client
  
  has_many :assignments
  has_many :projects, :through => :assignments
  
  
  mount_uploader :avatar, AvatarUploader
  
  attr_accessible :avatar, :phone, :name, :website, :bio, :time_mon, :time_tue, :time_wed, :time_thu, :time_fri, :in_company_since, :freelancer,
                  :birthday, :phone, :street, :zip, :city, :user_id, :job_description, :is_client, :client_id
  
  
  def self.next_birthdays
    self.find_birthdays_for(Date.today, Date.today + 30.days)
  end
  
  
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
