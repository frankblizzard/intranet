class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @search = Post.search do
      fulltext params[:search]
      paginate :page => params[:page]
      order_by :created_at, :desc
    end 
    
    @posts = @search.results
    @next_birthdays = Profile.next_birthdays
    @next_deadlines = Project.next_deadlines(current_user.profile)
    @upcoming_projects = Project.upcoming_projects(current_user.profile)
    @continous_projects = Project.continous_projects(current_user.profile)
    @ill_peeps = Hour.where(:date => Date.today, :ill => true)
    @holiday_peeps = Hour.where(:date => Date.today, :holiday => true)
    @comp_time_peeps = Hour.where(:date => Date.today, :comp_time => true)
  end

end
