class Task < ActiveRecord::Base
  
  validates_presence_of :name
  
  belongs_to :project
  has_many :hours
  
  attr_accessor :total_hours
  
  def total_hours
    self.hours.to_a.sum { |hour| hour.amount }
  end
  
end
