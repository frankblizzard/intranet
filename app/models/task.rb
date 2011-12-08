class Task < ActiveRecord::Base
  
  validates_presence_of :name
  validates_presence_of :plan_hours
  
  belongs_to :project
  has_many :hours
  
  attr_accessor :total_hours
  
  def total_hours
    self.hours.to_a.sum { |hour| hour.amount }
  end
  
end
