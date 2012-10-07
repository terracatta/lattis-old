class ScanSessionsController < ApplicationController
  # GET /scan_sessions
  # GET /scan_sessions.json
  def index
    @scan_sessions = ScanSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scan_sessions }
    end
  end

  # GET /scan_sessions/1
  # GET /scan_sessions/1.json
  def show
    @scan_session = ScanSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scan_session }
    end
  end

  # GET /scan_sessions/new
  # GET /scan_sessions/new.json
  def new
    @scan_session = ScanSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scan_session }
    end
  end

  # GET /scan_sessions/1/edit
  def edit
    @scan_session = ScanSession.find(params[:id])
  end

  # POST /scan_sessions
  # POST /scan_sessions.json
  def create
    @scan_session = ScanSession.new(scan_session_params)

    respond_to do |format|
      if @scan_session.save
        format.html { redirect_to @scan_session, notice: 'Scan session was successfully created.' }
        format.json { render json: @scan_session, status: :created, location: @scan_session }
      else
        format.html { render action: "new" }
        format.json { render json: @scan_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_sessions/1
  # PATCH/PUT /scan_sessions/1.json
  def update
    @scan_session = ScanSession.find(params[:id])

    respond_to do |format|
      if @scan_session.update_attributes(scan_session_params)
        format.html { redirect_to @scan_session, notice: 'Scan session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scan_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_sessions/1
  # DELETE /scan_sessions/1.json
  def destroy
    @scan_session = ScanSession.find(params[:id])
    @scan_session.destroy

    respond_to do |format|
      format.html { redirect_to scan_sessions_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def scan_session_params
      params.require(:scan_session).permit(:location_id, :subject_id, :user_id, :visit_id)
    end
end
