class JcCommentsController < ApplicationController
  # GET /jc_comments
  # GET /jc_comments.json
  def index
    @jc_comments = JcComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jc_comments }
    end
  end

  # GET /jc_comments/1
  # GET /jc_comments/1.json
  def show
    @jc_comment = JcComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jc_comment }
    end
  end

  # GET /jc_comments/new
  # GET /jc_comments/new.json
  def new
    @jc_comment = JcComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jc_comment }
    end
  end

  # GET /jc_comments/1/edit
  def edit
    @jc_comment = JcComment.find(params[:id])
  end

  # POST /jc_comments
  # POST /jc_comments.json
  def create
    @jc_comment = JcComment.new(params[:jc_comment])

    respond_to do |format|
      if @jc_comment.save
        format.html { redirect_to @jc_comment, notice: 'Jc comment was successfully created.' }
        format.json { render json: @jc_comment, status: :created, location: @jc_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @jc_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jc_comments/1
  # PUT /jc_comments/1.json
  def update
    @jc_comment = JcComment.find(params[:id])

    respond_to do |format|
      if @jc_comment.update_attributes(params[:jc_comment])
        format.html { redirect_to @jc_comment, notice: 'Jc comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @jc_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jc_comments/1
  # DELETE /jc_comments/1.json
  def destroy
    @jc_comment = JcComment.find(params[:id])
    @jc_comment.destroy

    respond_to do |format|
      format.html { redirect_to jc_comments_url }
      format.json { head :ok }
    end
  end
  
  # find commentable (parent) item
  def find_commentable
      params.each do |name, value|
          if name =~ /(.+)_id$/
              return $1.classify.constantize.find(value) 
          end
      end
      nil
  end
  
end
