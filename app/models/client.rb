class Client < ActiveRecord::Base
  
  validates_presence_of :name

  has_many :projects
  has_many :profiles
  
  searchable do
    text :name, :boost => 3
    text :full_name, :boost => 3
    text :client_nr, :boost => 3
  end
  
end
