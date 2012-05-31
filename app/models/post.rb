class Post < ActiveRecord::Base
  paginates_per 15
  
  auto_html_for :body do
     html_escape
     image_link
     youtube(:width => 400, :height => 250)
     link :target => "_blank", :rel => "nofollow"
     simple_format
   end
  
  belongs_to :post_category
  belongs_to :user
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  validates_presence_of :user_id
  #validates_presence_of :post_category_id
  validates_presence_of :title
  validates_presence_of :body
  
  #searchable do
  #  text :title, :boost => 3
  #  text :body
  #  time :created_at  
  #  text :comments do 
  #    comments.map(&:content)
  #  end
  #end
  
end
