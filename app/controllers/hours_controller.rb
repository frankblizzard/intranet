class HoursController < ApplicationController
  
  autocomplete :project, :name, :display_value => :name_number
  
  def get_autocomplete_items(parameters)
    items = Project.select("DISTINCT CONCAT_WS(' ', nr, name, id) AS full_name, nr, name, id").where(["CONCAT_WS(' ', nr, name) LIKE ?", "%#{parameters[:term]}%"])
  end
  
  # GET /hours
  # GET /hours.json
  def index
    @hours = current_user.hours
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hours }
    end
  end

  # GET /hours/1
  # GET /hours/1.json
  def show
    @hour = Hour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hour }
    end
  end

  # GET /hours/new
  # GET /hours/new.json
  def new
    @hour = Hour.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hour }
    end
  end

  # GET /hours/1/edit
  def edit
    @hour = Hour.find(params[:id])
  end

  # POST /hours
  # POST /hours.json
  def create
    @hour = Hour.create!(params[:hour])
    @spacer_height = 100 - Hour.total_percent_day(current_user, @hour.date)
  end

  # PUT /hours/1
  # PUT /hours/1.json
  def update
    @hour = Hour.find(params[:id])

    respond_to do |format|
      if @hour.update_attributes(params[:hour])
        format.html { redirect_to @hour, notice: 'Hour was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hours/1
  # DELETE /hours/1.json
  def destroy
    @hour = Hour.find(params[:id])
    @hour.destroy

    respond_to do |format|
      format.html { redirect_to hours_url }
      format.json { head :ok }
    end
  end
end
