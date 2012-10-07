class ScansController < ApplicationController
  # GET /scans
  # GET /scans.json
  def index
    @scans = Scan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scans }
    end
  end

  # GET /scans/1
  # GET /scans/1.json
  def show
    @scan = Scan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scan }
    end
  end

  # GET /scans/new
  # GET /scans/new.json
  def new
    @scan = Scan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scan }
    end
  end

  # GET /scans/1/edit
  def edit
    @scan = Scan.find(params[:id])
  end

  # POST /scans
  # POST /scans.json
  def create
    @scan = Scan.new(scan_params)

    respond_to do |format|
      if @scan.save
        format.html { redirect_to @scan, notice: 'Scan was successfully created.' }
        format.json { render json: @scan, status: :created, location: @scan }
      else
        format.html { render action: "new" }
        format.json { render json: @scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scans/1
  # PATCH/PUT /scans/1.json
  def update
    @scan = Scan.find(params[:id])

    respond_to do |format|
      if @scan.update_attributes(scan_params)
        format.html { redirect_to @scan, notice: 'Scan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scans/1
  # DELETE /scans/1.json
  def destroy
    @scan = Scan.find(params[:id])
    @scan.destroy

    respond_to do |format|
      format.html { redirect_to scans_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def scan_params
      params.require(:scan).permit(:date, :file, :location_id, :scan_format_id, :scan_sub_type_id, :scan_type_id, :study_id, :subject_id, :user_id, :visit_id)
    end
end
