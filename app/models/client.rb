class Client < ActiveRecord::Base
  
  validates_presence_of :client_nr
  validates_presence_of :name

  has_many :projects
  
end
