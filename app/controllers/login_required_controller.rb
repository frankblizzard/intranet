class LoginRequiredController < ApplicationController
  before_filter :authenticate_user!
  layout :home_layout
  
  private 
  
  def home_layout 
    current_user.profile.is_client? ? "client" : "application" 
  end
  
end
