class ScanTypesController < ApplicationController
  load_and_authorize_resource

  # GET /scan_types
  # GET /scan_types.json
  def index
    @scan_types = ScanType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scan_types }
    end
  end

  # GET /scan_types/1
  # GET /scan_types/1.json
  def show
    @scan_type = ScanType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scan_type }
    end
  end

  # GET /scan_types/new
  # GET /scan_types/new.json
  def new
    @scan_type = ScanType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scan_type }
    end
  end

  # GET /scan_types/1/edit
  def edit
    @scan_type = ScanType.find(params[:id])
  end

  # POST /scan_types
  # POST /scan_types.json
  def create
    @scan_type = ScanType.new(params[:scan_type])

    respond_to do |format|
      if @scan_type.save
        format.html { redirect_to @scan_type, notice: 'Scan type was successfully created.' }
        format.json { render json: @scan_type, status: :created, location: @scan_type }
      else
        format.html { render action: "new" }
        format.json { render json: @scan_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_types/1
  # PATCH/PUT /scan_types/1.json
  def update
    @scan_type = ScanType.find(params[:id])

    respond_to do |format|
      if @scan_type.update_attributes(params[:scan_type])
        format.html { redirect_to @scan_type, notice: 'Scan type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scan_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_types/1
  # DELETE /scan_types/1.json
  def destroy
    @scan_type = ScanType.find(params[:id])
    @scan_type.destroy

    respond_to do |format|
      format.html { redirect_to scan_types_url }
      format.json { head :no_content }
    end
  end
end
