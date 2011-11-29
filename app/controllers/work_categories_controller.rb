class WorkCategoriesController < ApplicationController
  # GET /work_categories
  # GET /work_categories.json
  def index
    @work_categories = WorkCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_categories }
    end
  end

  # GET /work_categories/1
  # GET /work_categories/1.json
  def show
    @work_category = WorkCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_category }
    end
  end

  # GET /work_categories/new
  # GET /work_categories/new.json
  def new
    @work_category = WorkCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_category }
    end
  end

  # GET /work_categories/1/edit
  def edit
    @work_category = WorkCategory.find(params[:id])
  end

  # POST /work_categories
  # POST /work_categories.json
  def create
    @work_category = WorkCategory.new(params[:work_category])

    respond_to do |format|
      if @work_category.save
        format.html { redirect_to @work_category, notice: 'Work category was successfully created.' }
        format.json { render json: @work_category, status: :created, location: @work_category }
      else
        format.html { render action: "new" }
        format.json { render json: @work_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_categories/1
  # PUT /work_categories/1.json
  def update
    @work_category = WorkCategory.find(params[:id])

    respond_to do |format|
      if @work_category.update_attributes(params[:work_category])
        format.html { redirect_to @work_category, notice: 'Work category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_categories/1
  # DELETE /work_categories/1.json
  def destroy
    @work_category = WorkCategory.find(params[:id])
    @work_category.destroy

    respond_to do |format|
      format.html { redirect_to work_categories_url }
      format.json { head :ok }
    end
  end
end
