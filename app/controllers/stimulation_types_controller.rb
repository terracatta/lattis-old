class StimulationTypesController < ApplicationController
  # GET /stimulation_types
  # GET /stimulation_types.json
  def index
    @stimulation_types = StimulationType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stimulation_types }
    end
  end

  # GET /stimulation_types/1
  # GET /stimulation_types/1.json
  def show
    @stimulation_type = StimulationType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stimulation_type }
    end
  end

  # GET /stimulation_types/new
  # GET /stimulation_types/new.json
  def new
    @stimulation_type = StimulationType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stimulation_type }
    end
  end

  # GET /stimulation_types/1/edit
  def edit
    @stimulation_type = StimulationType.find(params[:id])
  end

  # POST /stimulation_types
  # POST /stimulation_types.json
  def create
    @stimulation_type = StimulationType.new(params[:stimulation_type])

    respond_to do |format|
      if @stimulation_type.save
        format.html { redirect_to @stimulation_type, notice: 'Stimulation type was successfully created.' }
        format.json { render json: @stimulation_type, status: :created, location: @stimulation_type }
      else
        format.html { render action: "new" }
        format.json { render json: @stimulation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stimulation_types/1
  # PATCH/PUT /stimulation_types/1.json
  def update
    @stimulation_type = StimulationType.find(params[:id])

    respond_to do |format|
      if @stimulation_type.update_attributes(params[:stimulation_type])
        format.html { redirect_to @stimulation_type, notice: 'Stimulation type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stimulation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stimulation_types/1
  # DELETE /stimulation_types/1.json
  def destroy
    @stimulation_type = StimulationType.find(params[:id])
    @stimulation_type.destroy

    respond_to do |format|
      format.html { redirect_to stimulation_types_url }
      format.json { head :no_content }
    end
  end
end
