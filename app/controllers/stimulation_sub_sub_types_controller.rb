class StimulationSubSubTypesController < ApplicationController
  # GET /stimulation_sub_sub_types
  # GET /stimulation_sub_sub_types.json
  def index
    @stimulation_sub_sub_types = StimulationSubSubType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stimulation_sub_sub_types }
    end
  end

  # GET /stimulation_sub_sub_types/1
  # GET /stimulation_sub_sub_types/1.json
  def show
    @stimulation_sub_sub_type = StimulationSubSubType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stimulation_sub_sub_type }
    end
  end

  # GET /stimulation_sub_sub_types/new
  # GET /stimulation_sub_sub_types/new.json
  def new
    @stimulation_sub_sub_type = StimulationSubSubType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stimulation_sub_sub_type }
    end
  end

  # GET /stimulation_sub_sub_types/1/edit
  def edit
    @stimulation_sub_sub_type = StimulationSubSubType.find(params[:id])
  end

  # POST /stimulation_sub_sub_types
  # POST /stimulation_sub_sub_types.json
  def create
    @stimulation_sub_sub_type = StimulationSubSubType.new(params[:stimulation_sub_sub_type])

    respond_to do |format|
      if @stimulation_sub_sub_type.save
        format.html { redirect_to @stimulation_sub_sub_type, notice: 'Stimulation sub sub type was successfully created.' }
        format.json { render json: @stimulation_sub_sub_type, status: :created, location: @stimulation_sub_sub_type }
      else
        format.html { render action: "new" }
        format.json { render json: @stimulation_sub_sub_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stimulation_sub_sub_types/1
  # PATCH/PUT /stimulation_sub_sub_types/1.json
  def update
    @stimulation_sub_sub_type = StimulationSubSubType.find(params[:id])

    respond_to do |format|
      if @stimulation_sub_sub_type.update_attributes(params[:stimulation_sub_sub_type])
        format.html { redirect_to @stimulation_sub_sub_type, notice: 'Stimulation sub sub type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stimulation_sub_sub_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stimulation_sub_sub_types/1
  # DELETE /stimulation_sub_sub_types/1.json
  def destroy
    @stimulation_sub_sub_type = StimulationSubSubType.find(params[:id])
    @stimulation_sub_sub_type.destroy

    respond_to do |format|
      format.html { redirect_to stimulation_sub_sub_types_url }
      format.json { head :no_content }
    end
  end
end
