class StimulationsController < ApplicationController
  load_and_authorize_resource

  # GET /stimulations
  # GET /stimulations.json
  def index
    @stimulations = Stimulation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stimulations }
    end
  end

  # GET /stimulations/1
  # GET /stimulations/1.json
  def show
    @stimulation = Stimulation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stimulation }
    end
  end

  # GET /stimulations/new
  # GET /stimulations/new.json
  def new
    @stimulation = Stimulation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stimulation }
    end
  end

  # GET /stimulations/1/edit
  def edit
    @stimulation = Stimulation.find(params[:id])
  end

  # POST /stimulations
  # POST /stimulations.json
  def create
    @stimulation = Stimulation.new(params[:stimulation])

    respond_to do |format|
      if @stimulation.save
        format.html { redirect_to @stimulation, notice: 'Stimulation was successfully created.' }
        format.json { render json: @stimulation, status: :created, location: @stimulation }
      else
        format.html { render action: "new" }
        format.json { render json: @stimulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stimulations/1
  # PATCH/PUT /stimulations/1.json
  def update
    @stimulation = Stimulation.find(params[:id])

    respond_to do |format|
      if @stimulation.update_attributes(params[:stimulation])
        format.html { redirect_to @stimulation, notice: 'Stimulation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stimulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stimulations/1
  # DELETE /stimulations/1.json
  def destroy
    @stimulation = Stimulation.find(params[:id])
    @stimulation.destroy

    respond_to do |format|
      format.html { redirect_to stimulations_url }
      format.json { head :no_content }
    end
  end
end
