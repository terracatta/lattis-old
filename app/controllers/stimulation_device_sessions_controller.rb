class StimulationDeviceSessionsController < ApplicationController
  # GET /stimulation_device_sessions
  # GET /stimulation_device_sessions.json
  def index
    @stimulation_device_sessions = StimulationDeviceSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stimulation_device_sessions }
    end
  end

  # GET /stimulation_device_sessions/1
  # GET /stimulation_device_sessions/1.json
  def show
    @stimulation_device_session = StimulationDeviceSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stimulation_device_session }
    end
  end

  # GET /stimulation_device_sessions/new
  # GET /stimulation_device_sessions/new.json
  def new
    @stimulation_device_session = StimulationDeviceSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stimulation_device_session }
    end
  end

  # GET /stimulation_device_sessions/1/edit
  def edit
    @stimulation_device_session = StimulationDeviceSession.find(params[:id])
  end

  # POST /stimulation_device_sessions
  # POST /stimulation_device_sessions.json
  def create
    @stimulation_device_session = StimulationDeviceSession.new(stimulation_device_session_params)

    respond_to do |format|
      if @stimulation_device_session.save
        format.html { redirect_to @stimulation_device_session, notice: 'Stimulation device session was successfully created.' }
        format.json { render json: @stimulation_device_session, status: :created, location: @stimulation_device_session }
      else
        format.html { render action: "new" }
        format.json { render json: @stimulation_device_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stimulation_device_sessions/1
  # PATCH/PUT /stimulation_device_sessions/1.json
  def update
    @stimulation_device_session = StimulationDeviceSession.find(params[:id])

    respond_to do |format|
      if @stimulation_device_session.update_attributes(stimulation_device_session_params)
        format.html { redirect_to @stimulation_device_session, notice: 'Stimulation device session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stimulation_device_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stimulation_device_sessions/1
  # DELETE /stimulation_device_sessions/1.json
  def destroy
    @stimulation_device_session = StimulationDeviceSession.find(params[:id])
    @stimulation_device_session.destroy

    respond_to do |format|
      format.html { redirect_to stimulation_device_sessions_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def stimulation_device_session_params
      params.require(:stimulation_device_session).permit(:coil_id, :coil_model_id, :date, :stimulation_session_id, :stimulator_id, :stimulator_model_id, :study_id, :subject_id, :user_id)
    end
end
