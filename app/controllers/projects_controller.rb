class ProjectsController < ApplicationController
  load_and_authorize_resource
  
  before_filter :authenticate_user!
  
  # GET /projects
  # GET /projects.json
  def index
   # @search = Project.search do
   #   fulltext params[:search]
   #   paginate :page => params[:page]
   #   order_by :nr, :desc
   # end 
   #
   # @projects = @search.results
    
    if current_user.profile.is_client
      @projects = current_user.profile.client.projects.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
    else 
      @projects = Project.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page])
    end
    
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @project.tasks.order(:name)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    propose_nr = Integer(Project.order("nr desc").first.nr) + 1
    @project = Project.new(:nr => propose_nr, :active => true)
    @project.tasks.new(:name => "Project Mgmt", :description => "")
    @project.tasks.new(:name => "Pre-P", :description => "Moodboards | Examining project data, plans, briefing, etc.")
    @project.tasks.new(:name => "Web", :description => "Flatfinder/Boligvelger (eve-Estate)  |  CMS/Website (eve-Publisher)  |  Landingpage")
    @project.tasks.new(:name => "Undividable 3D work for exteriors", :description => "Modeling/texturing of buildings and their surroundings. Populating/detailing with plants, outdoor furniture, traffic, etc.")
    @project.tasks.new(:name => "Undividable 3D work for interiors", :description => "Modeling/texturing of X apartments. Setting up furniture, accessories, decoration according to moodboards.")
    @project.tasks.new(:name => "#{propose_nr}-01_e", :description => "Scene setup, lighting and detail adjustments, rendering with subsequent post-production/compositing.")
    @project.tasks.order(:name)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end
  
  def sort_column  
    controller_name.classify.constantize.column_names.include?(params[:sort]) ? params[:sort] : "nr"  
  end
  
  
end
