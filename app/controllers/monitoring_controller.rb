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

end
