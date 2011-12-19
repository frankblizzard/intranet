class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @search = Post.search do
      fulltext params[:search]
      paginate :page => params[:page]
    end 
    
    @posts = @search.results
    
  end

end
