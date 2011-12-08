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
  
private
  

  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end
     
end