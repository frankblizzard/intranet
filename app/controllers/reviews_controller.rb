class ReviewsController < LoginRequiredController
  # GET /reviews
  # GET /reviews.json
  def index
    
    if current_user.profile.is_client?
      @reviews = nil
    else
      @reviews = Review.all
    end

    respond_to do |format|
      format.html {
        if current_user.profile.is_client?
          redirect_to root_url, :flash => { :notice => 'Please navigate via Projects to see the reviews.' }
        end
      }
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])
    @project_leader = Profile.find(@review.project_leader_id) || Profile.first
    respond_to do |format|
      format.html {
        if current_user.profile.is_client?
          render :action => 'client_show'
        end
      }
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new
    if params[:project_id]
      session[:review_project_id] = params[:project_id]
    end
    @project = Project.find(session[:review_project_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    if current_user.profile.is_client?
      redirect_to root_url, :flash => { :error => 'Access denied!' }
    end
    @review = Review.find(params[:id])
    @project =  @review.project
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { 
          session[:review_project_id] = nil
          redirect_to @review, notice: 'Review was successfully created.' 
          }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :ok }
    end
  end
end
