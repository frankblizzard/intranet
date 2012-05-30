class Client < ActiveRecord::Base
  
  validates_presence_of :name
  validates_length_of :billing_code, :minimum => 3, :maximum => 3, :allow_blank => true
  validates_numericality_of :payment_within

  has_many :projects
  has_many :profiles
  
  
  def self.search(search)  
    if search  
      where('name LIKE ? OR full_name LIKE ?', "%#{search}%", "%#{search}%")  
    else  
      scoped  
    end  
  end
  
end
