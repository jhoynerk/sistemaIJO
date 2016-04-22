class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    setter_params_to_activities
    setter_multiple_activities if params[:activity].present?
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'El evento fue creado éxitosamente.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'El evento fue modificado éxitosamente.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'El evento fue eliminado éxitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description, :date_start, :date_end, :beneficiary_id, :area_id,
                                    activities_attributes: [:beneficiary_id, :description, :day, :time_start, :time_end, :event_id, :area_id, :_destroy] )
    end

    def setter_params_to_activities
      @event.activities.each do |a|
        a.beneficiary_id = params[:event][:beneficiary_id]
        a.area_id = params[:event][:area_id]
      end
    end

    def setter_multiple_activities
      params[:activity].each do |key, calendar|
        setter_calendar(calendar)
        (calendar[:date_start].to_datetime..calendar[:date_end].to_datetime).each do |f|
          calendar[:days].each do |d|
            if d.to_i == f.wday
              @event.activities.build(beneficiary_id: @event.beneficiary_id, area_id: @event.area_id, description: @event.description, day: f, time_start: calendar[:time_start].to_time, time_end: calendar[:time_end].to_time)
            end
          end
        end
      end
    end

    def setter_calendar(calendar)
      if @event.date_start.nil?
        @event.date_start = calendar[:date_start].to_datetime
      else
        if @event.date_start.to_datetime > calendar[:date_start].to_datetime
          @event.date_start = calendar[:date_start].to_datetime
        end
      end
      if @event.date_end.nil?
        @event.date_end = calendar[:date_end].to_datetime
      else
        if @event.date_end.to_datetime > calendar[:date_end].to_datetime
          @event.date_end = calendar[:date_end].to_datetime
        end
      end
    end
end
