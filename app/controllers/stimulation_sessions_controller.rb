class StimulationSessionsController < ApplicationController
  # GET /stimulation_sessions
  # GET /stimulation_sessions.json
  def index
    @stimulation_sessions = StimulationSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stimulation_sessions }
    end
  end

  # GET /stimulation_sessions/1
  # GET /stimulation_sessions/1.json
  def show
    @stimulation_session = StimulationSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stimulation_session }
    end
  end

  # GET /stimulation_sessions/new
  # GET /stimulation_sessions/new.json
  def new
    @stimulation_session = StimulationSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stimulation_session }
    end
  end

  # GET /stimulation_sessions/1/edit
  def edit
    @stimulation_session = StimulationSession.find(params[:id])
  end

  # POST /stimulation_sessions
  # POST /stimulation_sessions.json
  def create
    @stimulation_session = StimulationSession.new(params[:stimulation_session])

    respond_to do |format|
      if @stimulation_session.save
        format.html { redirect_to @stimulation_session, notice: 'Stimulation session was successfully created.' }
        format.json { render json: @stimulation_session, status: :created, location: @stimulation_session }
      else
        format.html { render action: "new" }
        format.json { render json: @stimulation_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stimulation_sessions/1
  # PATCH/PUT /stimulation_sessions/1.json
  def update
    @stimulation_session = StimulationSession.find(params[:id])

    respond_to do |format|
      if @stimulation_session.update_attributes(params[:stimulation_session])
        format.html { redirect_to @stimulation_session, notice: 'Stimulation session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stimulation_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stimulation_sessions/1
  # DELETE /stimulation_sessions/1.json
  def destroy
    @stimulation_session = StimulationSession.find(params[:id])
    @stimulation_session.destroy

    respond_to do |format|
      format.html { redirect_to stimulation_sessions_url }
      format.json { head :no_content }
    end
  end
end
