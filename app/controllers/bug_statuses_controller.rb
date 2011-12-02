class BugStatusesController < ApplicationController
  # GET /bug_statuses
  # GET /bug_statuses.json
  def index
    @bug_statuses = BugStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bug_statuses }
    end
  end

  # GET /bug_statuses/1
  # GET /bug_statuses/1.json
  def show
    @bug_status = BugStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bug_status }
    end
  end

  # GET /bug_statuses/new
  # GET /bug_statuses/new.json
  def new
    @bug_status = BugStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bug_status }
    end
  end

  # GET /bug_statuses/1/edit
  def edit
    @bug_status = BugStatus.find(params[:id])
  end

  # POST /bug_statuses
  # POST /bug_statuses.json
  def create
    @bug_status = BugStatus.new(params[:bug_status])

    respond_to do |format|
      if @bug_status.save
        format.html { redirect_to @bug_status, notice: 'Bug status was successfully created.' }
        format.json { render json: @bug_status, status: :created, location: @bug_status }
      else
        format.html { render action: "new" }
        format.json { render json: @bug_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bug_statuses/1
  # PUT /bug_statuses/1.json
  def update
    @bug_status = BugStatus.find(params[:id])

    respond_to do |format|
      if @bug_status.update_attributes(params[:bug_status])
        format.html { redirect_to @bug_status, notice: 'Bug status was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bug_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_statuses/1
  # DELETE /bug_statuses/1.json
  def destroy
    @bug_status = BugStatus.find(params[:id])
    @bug_status.destroy

    respond_to do |format|
      format.html { redirect_to bug_statuses_url }
      format.json { head :ok }
    end
  end
end
