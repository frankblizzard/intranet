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
  
end
