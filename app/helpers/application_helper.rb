module ApplicationHelper
  def markdown(text)  
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]  
    Redcarpet.new(text, *options).to_html.html_safe  
  end
  
  def present(object, klass=nil)
    klass||="#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
  
  def hour_tag(hour)
    klass = ""
    if hour.ill 
      klass = "ill title"
    elsif hour.extra
      klass = "extra title"
    elsif hour.holiday
      klass = "holiday title"
    else 
      klass = "regular title"
    end
    content_tag :li, '', :class => klass, :style => "height: #{ hour.percent_day }%", :title => "#{hour.amount} hrs | #{hour.project.name_number} > #{hour.task ? (hour.task.name.to_s + " > ") : "" } #{hour.description}", :data => { :hour_id => hour.id}
  end
  
end
