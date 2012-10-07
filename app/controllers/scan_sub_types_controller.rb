class ScanSubTypesController < ApplicationController
  # GET /scan_sub_types
  # GET /scan_sub_types.json
  def index
    @scan_sub_types = ScanSubType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scan_sub_types }
    end
  end

  # GET /scan_sub_types/1
  # GET /scan_sub_types/1.json
  def show
    @scan_sub_type = ScanSubType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scan_sub_type }
    end
  end

  # GET /scan_sub_types/new
  # GET /scan_sub_types/new.json
  def new
    @scan_sub_type = ScanSubType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scan_sub_type }
    end
  end

  # GET /scan_sub_types/1/edit
  def edit
    @scan_sub_type = ScanSubType.find(params[:id])
  end

  # POST /scan_sub_types
  # POST /scan_sub_types.json
  def create
    @scan_sub_type = ScanSubType.new(scan_sub_type_params)

    respond_to do |format|
      if @scan_sub_type.save
        format.html { redirect_to @scan_sub_type, notice: 'Scan sub type was successfully created.' }
        format.json { render json: @scan_sub_type, status: :created, location: @scan_sub_type }
      else
        format.html { render action: "new" }
        format.json { render json: @scan_sub_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_sub_types/1
  # PATCH/PUT /scan_sub_types/1.json
  def update
    @scan_sub_type = ScanSubType.find(params[:id])

    respond_to do |format|
      if @scan_sub_type.update_attributes(scan_sub_type_params)
        format.html { redirect_to @scan_sub_type, notice: 'Scan sub type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scan_sub_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_sub_types/1
  # DELETE /scan_sub_types/1.json
  def destroy
    @scan_sub_type = ScanSubType.find(params[:id])
    @scan_sub_type.destroy

    respond_to do |format|
      format.html { redirect_to scan_sub_types_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def scan_sub_type_params
      params.require(:scan_sub_type).permit(:description, :name, :scan_type_id)
    end
end
