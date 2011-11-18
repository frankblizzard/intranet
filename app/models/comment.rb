class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  
  auto_html_for :content do
     html_escape
     image
     youtube(:width => 250, :height => 156)
     link :target => "_blank", :rel => "nofollow"
     simple_format
   end
  
end
