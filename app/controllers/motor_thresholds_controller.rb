class MotorThresholdsController < ApplicationController
  # GET /motor_thresholds
  # GET /motor_thresholds.json
  def index
    @motor_thresholds = MotorThreshold.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @motor_thresholds }
    end
  end

  # GET /motor_thresholds/1
  # GET /motor_thresholds/1.json
  def show
    @motor_threshold = MotorThreshold.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @motor_threshold }
    end
  end

  # GET /motor_thresholds/new
  # GET /motor_thresholds/new.json
  def new
    @motor_threshold = MotorThreshold.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @motor_threshold }
    end
  end

  # GET /motor_thresholds/1/edit
  def edit
    @motor_threshold = MotorThreshold.find(params[:id])
  end

  # POST /motor_thresholds
  # POST /motor_thresholds.json
  def create
    @motor_threshold = MotorThreshold.new(motor_threshold_params)

    respond_to do |format|
      if @motor_threshold.save
        format.html { redirect_to @motor_threshold, notice: 'Motor threshold was successfully created.' }
        format.json { render json: @motor_threshold, status: :created, location: @motor_threshold }
      else
        format.html { render action: "new" }
        format.json { render json: @motor_threshold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motor_thresholds/1
  # PATCH/PUT /motor_thresholds/1.json
  def update
    @motor_threshold = MotorThreshold.find(params[:id])

    respond_to do |format|
      if @motor_threshold.update_attributes(motor_threshold_params)
        format.html { redirect_to @motor_threshold, notice: 'Motor threshold was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @motor_threshold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motor_thresholds/1
  # DELETE /motor_thresholds/1.json
  def destroy
    @motor_threshold = MotorThreshold.find(params[:id])
    @motor_threshold.destroy

    respond_to do |format|
      format.html { redirect_to motor_thresholds_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def motor_threshold_params
      params.require(:motor_threshold).permit(:coil_id, :date, :determination, :intensity, :stimulation_session_id, :stimulator_id, :variety)
    end
end
