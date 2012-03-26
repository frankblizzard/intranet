class ProjectPresenter < BasePresenter 
  presents :project
  
  def project_nr
    handle_none project.nr do
      project.nr
    end
  end

  def title
    handle_none project.name do
      project.name
    end
  end
  
  def status
    handle_none project.project_status do
      project.project_status.name
    end
  end

  def client
    handle_none project.client.name do
      project.client.name
    end
  end
  
  def description
    handle_none project.description do
      project.description
    end
  end
  
  def tasks
    handle_none project.tasks do
      str = '<ul class="tasks">'
      # hundred_percent = 250 # define the width in pixels that should be used to display 100% plan hours
      
      # use 100% for the task with the most hours in project
      hundred_percent = project.tasks.order('plan_hours desc').first.plan_hours
      # width of the maximum element 
      max_width = 250
      
      
      
      project.tasks.order("deadline asc").each do |t|
        str += "<li class='task_details'><b>#{t.id} - #{t.name} <i>(#{t.deadline.strftime('%d.%m.%y')})</i></b><br/>"
        
        # calculate with relative to maximum
        task_width = (t.plan_hours / hundred_percent) * max_width
        
        if t.plan_hours
          percent_done = t.total_hours > 0 ? (t.total_hours / hundred_percent) : 0
          if percent_done > 0
            width_done = percent_done * max_width
          else
            width_done = 30
          end
          
          str += "<table class=\"task_table\">"
          str += "<tr><td class='planned' style='width:#{task_width}px;'>planned: #{t.plan_hours}</td></tr>"
          str += "<tr><td class='spent #{ 'red' if width_done > task_width }' style='width:#{width_done}px;'>spent: #{t.total_hours}</td></tr>"
          str += "</table>"
          str += "<br/>" 
          str += "<div class='task_description'>#{markdown(t.description)}</div>"
          str += "<br/>" 
        end
        str += "</li>"
      end
      str += "</ul>"
      str.html_safe
    end  
  end
  
  def people
    handle_none project.assignments do
      str = '<ul class="profiles">'
      project.assignments.each do |p|
        str += "<li>#{p.profile.name} <i>#{p.role ? "(" + p.role + ")" : ""}</i></li>"
      end
      str += "</ul>"
      str.html_safe
    end  
  end
  
  
  def hours_spent
    handle_none project.hours do
      str = '<div class="subtitle">Project Hours</div>'
      str += '<ul class="profiles">'
      project.project_users.each do |u|
        profile = Profile.find_by_user_id(u)
        str += "<li>#{profile.name} - <i>#{project.total_hours(u)} hours (#{project.total_hours(u, true)} extra)</i></li>"
      end
      str += "<li>---------------------------</li>"
      str += "<li><b>Summe: #{project.total_hours} (#{project.total_hours(nil, true)} extra)</b></li>"
      str += "</ul>"
      str.html_safe
    end  
  end
     
  def hour_details
    handle_none project.hours do
      str = '<div class="subtitle">Time spent on this project</div>'
      str += '<div class="hours_detail_table"><table>'
      str += '<tr><th>Name</th><th>Job</th><th>Hours</th><th>Extra Hours</th></tr>'
      project.project_users.each do |u|
        profile = Profile.find_by_user_id(u)
        str += '<tr>'
        str += "<td>#{link_to profile.name, profile if profile.name }</td><td>#{profile.job_description}</td><td>#{project.total_hours(u)}</td><td>#{project.total_hours(u, true)}</td><td class='hour_details'><a class='detail_link' href='#'>details</a>"
        
        #adding a detailed table
        
        str += '<div class="user_hours"><table>'
        # add detailed overview per user
        str += "<tr><th>date</th><th>hours</th><th>extra</th><th>description</th><th>task</th><th>category</th></tr>"
        project.user_hours(u).each do |h|
          str += "<tr><td>#{link_to h.date.strftime('%d.%m.%y'), edit_hour_path(h)}</td><td>#{h.amount}</td><td>#{h.extra? ? 'yes' : 'no' }</td><td>#{h.description}</td><td>#{h.task.nil? ? 'none' : h.task.name }</td><td>#{ h.work_category.nil? ? '--' : h.work_category.name }</td></tr>"
        end
        
        str += "</table>"
        
        str += '</td>'
        
        
        
        str += '</tr>'
      end
      str += '<tr class="table_total">'
      str += "<td><b>Summe</b></td><td>--</td><td><b>#{project.total_hours}</b></td><td><b>#{project.total_hours(nil, true)}</b></td>"
      str += "</tr></table>"
      str.html_safe
    end  
  end

 
private
  

  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end
     
end