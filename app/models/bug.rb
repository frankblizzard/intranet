class Bug < ActiveRecord::Base
  
  validates_presence_of :user_id
  validates_presence_of :description
  validates_presence_of :title
  
  belongs_to :user
  belongs_to :bug_status
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
end
