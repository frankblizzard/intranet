class Post < ActiveRecord::Base
  belongs_to :post_category
  belongs_to :user
  
  has_many :comments, :as => :commentable  
  
  
end
