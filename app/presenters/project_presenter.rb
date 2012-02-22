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
      hundred_percent = 250 # define the width in pixels that should be used to display 100% plan hours
      project.tasks.order("deadline asc").each do |t|
        str += "<li>#{t.name} <i>(#{t.deadline.strftime('%d.%m.%y')})</i><br/>"
        if t.plan_hours
          percent_done = t.total_hours > 0 ? (t.plan_hours * 100 / t.total_hours) : 0
          if percent_done > 0
            width_done = hundred_percent * 100 / percent_done
          else
            width_done = 30
          end
          str += "<table class=\"task_table\">"
          str += "<tr><td class='planned' style='width:#{hundred_percent}px;'>planned</td><td>#{t.plan_hours}</td></tr>"
          str += "<tr><td class='spent' style='width:#{width_done}px;'>spent</td><td>#{t.total_hours}</td></tr>"
          str += "</table>"
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
      str += '<tr><th>Name</th><th>Hours</th><th>Extra Hours</th></tr>'
      project.project_users.each do |u|
        profile = Profile.find_by_user_id(u)
        str += '<tr>'
        str += "<td>#{link_to profile.name, profile}</td><td>#{project.total_hours(u)}</td><td>#{project.total_hours(u, true)}</td><td class='hour_details'><a class='detail_link' href='#'>details</a>"
        
        #adding a detailed table
        
        str += '<div class="user_hours"><table>'
        # add detailed overview per user
        str += "<tr><th>date</th><th>hours</th><th>extra</th><th>description</th><th>task</th></tr>"
        project.user_hours(u).each do |h|
          str += "<tr><td>#{link_to h.date.strftime('%d.%m.%y'), edit_hour_path(h)}</td><td>#{h.amount}</td><td>#{h.extra? ? 'yes' : 'no' }</td><td>#{h.description}</td><td>#{h.task.nil? ? 'none' : h.task.name }</td></tr>"
        end
        
        str += "</table>"
        
        str += '</td>'
        
        
        
        str += '</tr>'
      end
      str += '<tr class="table_total">'
      str += "<td><b>Summe</b></td><td><b>#{project.total_hours}</b></td><td><b>#{project.total_hours(nil, true)}</b></td>"
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