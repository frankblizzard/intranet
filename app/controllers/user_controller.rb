class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.order('username asc')
  end


  def show
    @user = User.find(params[:id])
  end
 
  def new
    @user = User.new
  end
 
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
 
  # POST /users
  # POST /users.json
  def create
    @user = User.create!(params[:user]) 
  end
 
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'User was successfully updated.' 
    else
      render :action => 'edit'
    end
  end
 
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :message => 'User deleted.'
  end

end
