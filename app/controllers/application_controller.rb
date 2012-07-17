class ApplicationController < ActionController::Base
  protect_from_forgery

  
  helper_method :sort_column, :sort_direction 
  


  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"  
  end
  
  def sort_column  
    controller_name.classify.constantize.column_names.include?(params[:sort]) ? params[:sort] : "name"  
  end
  
end
