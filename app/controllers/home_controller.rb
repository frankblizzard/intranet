class HomeController < LoginRequiredController
  
  def index
    
    render :template => "home/client_view" if current_user.profile.is_client
    
    render :action => 'client_home' if current_user.profile.is_client?

      @posts = Post.order("created_at desc")
      @next_birthdays = Profile.next_birthdays
      @next_deadlines = Project.next_deadlines(current_user.profile)
      @upcoming_projects = Project.upcoming_projects(current_user.profile)
      @continous_projects = Project.continous_projects(current_user.profile)
      @ill_peeps = Hour.where(:date => Date.today, :ill => true)
      @holiday_peeps = Hour.where(:date => Date.today, :holiday => true)
      @comp_time_peeps = Hour.where(:date => Date.today, :comp_time => true)


  end

end
