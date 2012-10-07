class BrainAreasController < ApplicationController
  # GET /brain_areas
  # GET /brain_areas.json
  def index
    @brain_areas = BrainArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brain_areas }
    end
  end

  # GET /brain_areas/1
  # GET /brain_areas/1.json
  def show
    @brain_area = BrainArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brain_area }
    end
  end

  # GET /brain_areas/new
  # GET /brain_areas/new.json
  def new
    @brain_area = BrainArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brain_area }
    end
  end

  # GET /brain_areas/1/edit
  def edit
    @brain_area = BrainArea.find(params[:id])
  end

  # POST /brain_areas
  # POST /brain_areas.json
  def create
    @brain_area = BrainArea.new(brain_area_params)

    respond_to do |format|
      if @brain_area.save
        format.html { redirect_to @brain_area, notice: 'Brain area was successfully created.' }
        format.json { render json: @brain_area, status: :created, location: @brain_area }
      else
        format.html { render action: "new" }
        format.json { render json: @brain_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brain_areas/1
  # PATCH/PUT /brain_areas/1.json
  def update
    @brain_area = BrainArea.find(params[:id])

    respond_to do |format|
      if @brain_area.update_attributes(brain_area_params)
        format.html { redirect_to @brain_area, notice: 'Brain area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brain_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brain_areas/1
  # DELETE /brain_areas/1.json
  def destroy
    @brain_area = BrainArea.find(params[:id])
    @brain_area.destroy

    respond_to do |format|
      format.html { redirect_to brain_areas_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def brain_area_params
      params.require(:brain_area).permit(:left_hemisphere, :name, :short_name)
    end
end
