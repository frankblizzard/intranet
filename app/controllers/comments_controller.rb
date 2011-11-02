class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @comments = Comment.all
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
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to @comment, :notice => 'Comment was successfully created.'
    else
      render :action => "new"
    end
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
  end
end
