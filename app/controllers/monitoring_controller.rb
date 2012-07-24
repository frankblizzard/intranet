class MonitoringController < LoginRequiredController
 
  def index
    @new_projects = Project.with_status(11)
    @offered_projects = Project.with_status(9)
    @declined_projects = Project.with_status(10)
    
    @progress_projects = Project.with_status(1)
    @scheduled_projects = Project.with_status(4)
    @hold_projects = Project.with_status(5)

    @completed_projects = Project.with_status(3)
    @invoiced_ger_projects = Project.with_status(6)
    @invoiced_nor_projects = Project.with_status(7)
  end
  
  def controlling
    @profiles = Profile.eve.worker.order('name')
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    respond_to do |format|
      format.html {
        if current_user.profile.is_client?
          redirect_to root_url, :flash => { :error => 'Access denied!' }
        end
      }
      format.xls
    end
  end

end
