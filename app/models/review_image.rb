require 'paperclip_processors/watermark'

class ReviewImage < ActiveRecord::Base
  
  validates_presence_of :review_id
  
  
  belongs_to :review
  belongs_to :project

  has_many :comments, :as => :commentable, :dependent => :destroy
  
  has_attached_file :photo,
                    :processors => [:watermark],
                    :styles => { 
                      :medium =>{
                          :geometry => "800x800>",
                          :watermark_path => "#{Rails.root}/public/images/watermark.png"
                        },
                      :thumb => "200x200>" 
                    }
  
end
