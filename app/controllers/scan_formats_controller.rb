class ScanFormatsController < ApplicationController
  # GET /scan_formats
  # GET /scan_formats.json
  def index
    @scan_formats = ScanFormat.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scan_formats }
    end
  end

  # GET /scan_formats/1
  # GET /scan_formats/1.json
  def show
    @scan_format = ScanFormat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scan_format }
    end
  end

  # GET /scan_formats/new
  # GET /scan_formats/new.json
  def new
    @scan_format = ScanFormat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scan_format }
    end
  end

  # GET /scan_formats/1/edit
  def edit
    @scan_format = ScanFormat.find(params[:id])
  end

  # POST /scan_formats
  # POST /scan_formats.json
  def create
    @scan_format = ScanFormat.new(params[:scan_format])

    respond_to do |format|
      if @scan_format.save
        format.html { redirect_to @scan_format, notice: 'Scan format was successfully created.' }
        format.json { render json: @scan_format, status: :created, location: @scan_format }
      else
        format.html { render action: "new" }
        format.json { render json: @scan_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_formats/1
  # PATCH/PUT /scan_formats/1.json
  def update
    @scan_format = ScanFormat.find(params[:id])

    respond_to do |format|
      if @scan_format.update_attributes(params[:scan_format])
        format.html { redirect_to @scan_format, notice: 'Scan format was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scan_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_formats/1
  # DELETE /scan_formats/1.json
  def destroy
    @scan_format = ScanFormat.find(params[:id])
    @scan_format.destroy

    respond_to do |format|
      format.html { redirect_to scan_formats_url }
      format.json { head :no_content }
    end
  end
end
