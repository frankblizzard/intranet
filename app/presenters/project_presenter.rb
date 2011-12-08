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
      project.tasks.each do |t|
        str += "<li>#{t.name} <i>(#{t.deadline.strftime('%d.%m.%y')})</i></li>"
      end
      str += "</ul>"
      str.html_safe
    end  
  end
  
  def people
    handle_none project.assignments do
      str = '<ul class="profiles">'
      project.assignments.each do |p|
        str += "<li>#{p.profile.name} <i>#{p.role ? "(p.role)" || ""})</i></li>"
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