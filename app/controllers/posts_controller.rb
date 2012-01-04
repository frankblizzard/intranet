class PostsController < ApplicationController
  load_and_authorize_resource
  
  before_filter :authenticate_user!
  
  def index
    @search = Post.search do
      fulltext params[:search]
      paginate :page => params[:page]
      order_by :created_at, :desc
    end 
    
    @posts = @search.results
    respond_to do |format|
      format.html { render 'home/index' }
      format.js { render 'posts/index.js' }
    end
  end


  def show
    @post = Post.find(params[:id])
  end
 
  def new
    @post = Post.new
  end
 
  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end
 
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.create!(params[:post]) 
  end
 
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice => 'Post was successfully updated.' 
    else
      render :action => 'edit'
    end
  end
 
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, :message => 'Post deleted.'
  end

end
