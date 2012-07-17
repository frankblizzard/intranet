class ReviewAssignment < ActiveRecord::Base
  belongs_to :profile
  belongs_to :review
end
