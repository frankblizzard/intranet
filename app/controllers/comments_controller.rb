class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @commentable = find_commentable 
    @comments = @commentable.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @commentable = find_commentable 
    #@comment = @commentable.comments.build(params[:comment])
    @comment = Comment.create!(params[:comment])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, :notice => 'Comment was successfully updated.' 
    else
      render :action => 'edit'
      
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url, :message => 'Comment deleted.'
  end
  
  # find commentable (parent) item
  def find_commentable
      params.each do |name, value|
          if name =~ /(.+)_id$/
              return $1.classify.constantize.find(value) unless name == 'user_id'
          end
      end
      nil
  end
  
end
