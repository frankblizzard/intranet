class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  has_many :comments
  has_many :posts
  has_one  :profile
  has_many :bugs
  
  has_many :hours
  
  validates_uniqueness_of :username
  
  after_create :set_profile
  
  def set_profile
    self.build_profile(:user_id => self.id)
  end
  
  def hours_today
    self.hours.where(:date => Date.today).to_a.sum { |hour| hour.amount }
  end
  
end
