class Assignment < ActiveRecord::Base
  belongs_to :profile
  belongs_to :project
end
