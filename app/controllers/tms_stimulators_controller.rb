class TmsStimulatorsController < ApplicationController
  load_and_authorize_resource

  # GET /tms_stimulators
  # GET /tms_stimulators.json
  def index
    @devices = Device.all
    @tms_stimulators = TmsStimulator.all
    @coils = Coil.all
    @tdcs_coils = TdcsStimulator.all

    @sidebar = true

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tms_stimulators }
    end
  end

  # GET /tms_stimulators/1
  # GET /tms_stimulators/1.json
  def show
    @tms_stimulator = TmsStimulator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tms_stimulator }
    end
  end

  # GET /tms_stimulators/new
  # GET /tms_stimulators/new.json
  def new
    @tms_stimulator = TmsStimulator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tms_stimulator }
    end
  end

  # GET /tms_stimulators/1/edit
  def edit
    @tms_stimulator = TmsStimulator.find(params[:id])
  end

  # POST /tms_stimulators
  # POST /tms_stimulators.json
  def create
    @tms_stimulator = TmsStimulator.new(params[:tms_stimulator])

    respond_to do |format|
      if @tms_stimulator.save
        format.html { redirect_to @tms_stimulator, notice: 'TMS Stimulator was successfully created.' }
        format.json { render json: @tms_stimulator, status: :created, location: @tms_stimulator }
      else
        format.html { render action: "new" }
        format.json { render json: @tms_stimulator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tms_stimulators/1
  # PATCH/PUT /tms_stimulators/1.json
  def update
    @tms_stimulator = TmsStimulator.find(params[:id])

    respond_to do |format|
      if @tms_stimulator.update_attributes(params[:tms_stimulator])
        format.html { redirect_to @tms_stimulator, notice: 'TMS Stimulator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tms_stimulator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tms_stimulators/1
  # DELETE /tms_stimulators/1.json
  def destroy
    @tms_stimulator = TmsStimulator.find(params[:id])
    @tms_stimulator.destroy

    respond_to do |format|
      format.html { redirect_to tms_stimulators_url }
      format.json { head :no_content }
    end
  end
end
