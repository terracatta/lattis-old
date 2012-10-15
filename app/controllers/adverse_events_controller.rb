class AdverseEventsController < ApplicationController
  # GET /adverse_events
  # GET /adverse_events.json
  def index
    @adverse_events = AdverseEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adverse_events }
    end
  end

  # GET /adverse_events/1
  # GET /adverse_events/1.json
  def show
    @adverse_event = AdverseEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adverse_event }
    end
  end

  # GET /adverse_events/new
  # GET /adverse_events/new.json
  def new
    @adverse_event = AdverseEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adverse_event }
    end
  end

  # GET /adverse_events/1/edit
  def edit
    @adverse_event = AdverseEvent.find(params[:id])
  end

  # POST /adverse_events
  # POST /adverse_events.json
  def create
    @adverse_event = AdverseEvent.new(adverse_event_params)

    respond_to do |format|
      if @adverse_event.save
        format.html { redirect_to @adverse_event, notice: 'Adverse event was successfully created.' }
        format.json { render json: @adverse_event, status: :created, location: @adverse_event }
      else
        format.html { render action: "new" }
        format.json { render json: @adverse_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverse_events/1
  # PATCH/PUT /adverse_events/1.json
  def update
    @adverse_event = AdverseEvent.find(params[:id])

    respond_to do |format|
      if @adverse_event.update_attributes(adverse_event_params)
        format.html { redirect_to @adverse_event, notice: 'Adverse event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adverse_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverse_events/1
  # DELETE /adverse_events/1.json
  def destroy
    @adverse_event = AdverseEvent.find(params[:id])
    @adverse_event.destroy

    respond_to do |format|
      format.html { redirect_to adverse_events_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def adverse_event_params
      params.require(:adverse_event).permit(:date, :enrollment_id, :event_description, :related, :serious, :unexpected)
    end
end
