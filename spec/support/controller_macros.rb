# Example methods taken from: https://github.com/plataformatec/devise/wiki/How-To:-Controllers-and-Views-tests-with-Rails-3-%28and-rspec%29
module ControllerMacros
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user
  end
  
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in Factory.create(:admin) # Using factory girl as an example
    end
  end

  def login_user
      user = Factory.create(:user)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in user
  end
end