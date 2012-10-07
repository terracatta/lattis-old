class DeviceModelsController < ApplicationController
  # GET /device_models
  # GET /device_models.json
  def index
    @device_models = DeviceModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @device_models }
    end
  end

  # GET /device_models/1
  # GET /device_models/1.json
  def show
    @device_model = DeviceModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device_model }
    end
  end

  # GET /device_models/new
  # GET /device_models/new.json
  def new
    @device_model = DeviceModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device_model }
    end
  end

  # GET /device_models/1/edit
  def edit
    @device_model = DeviceModel.find(params[:id])
  end

  # POST /device_models
  # POST /device_models.json
  def create
    @device_model = DeviceModel.new(params[:device_model])

    respond_to do |format|
      if @device_model.save
        format.html { redirect_to @device_model, notice: 'Device model was successfully created.' }
        format.json { render json: @device_model, status: :created, location: @device_model }
      else
        format.html { render action: "new" }
        format.json { render json: @device_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_models/1
  # PATCH/PUT /device_models/1.json
  def update
    @device_model = DeviceModel.find(params[:id])

    respond_to do |format|
      if @device_model.update_attributes(params[:device_model])
        format.html { redirect_to @device_model, notice: 'Device model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_models/1
  # DELETE /device_models/1.json
  def destroy
    @device_model = DeviceModel.find(params[:id])
    @device_model.destroy

    respond_to do |format|
      format.html { redirect_to device_models_url }
      format.json { head :no_content }
    end
  end
end
