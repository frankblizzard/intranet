class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  
  auto_html_for :content do
     html_escape
     image_link
     youtube(:width => 240, :height => 150)
     link :target => "_blank", :rel => "nofollow"
     simple_format
   end
  
end
