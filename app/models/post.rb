class Post < ActiveRecord::Base
  belongs_to :post_category
  
  has_many :comments, :as => :commentable  
  
  
end
