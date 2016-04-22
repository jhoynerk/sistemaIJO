class OrderController < ApplicationController
  before_action :authenticate_user!
  def index
    @activity = Activity.new
    @activities = Activity.pendings_and_process.date_expired
    @beneficiary = Beneficiary.new
  end

  def create
    @activity = Activity.find(params[:order][:activity_id])
    if @activity.incidence.nil?
      @activity.create_incidence(observations: params[:order][:observations], activity_id: @activity.id) unless params[:order][:observations].empty?
    else
      unless params[:order][:observations].empty?
        incidencia = @activity.incidence
        incidencia.observations = params[:order][:observations]
        incidencia.save!
      end
    end
    @activity.status = params[:order][:status]
    respond_to do |format|
      if @activity.save
        unless params[:order][:resources].nil?
          params[:order][:resources].each do |r, v|
            resource = Resource.find(v[:id])
            resource.status = v[:status]
            resource.incidences.build(observations: v[:observations], resource_id: resource.id, activity_id: @activity.id) unless v[:observations].empty?
            resource.save!
          end
        end
        format.html { redirect_to prestamos_path, notice: 'El prestamo fue cerrado éxitosamente.' }
        format.json { render :show, status: :created, location: @activity }
      else
        p @activity.errors.inspect
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:code, :description, :start_date_field, :start_time_field, :end_date_field, :end_time_field, :event_id)
  end

  def event_params
    params.require(:event).permit(:code, :description, :observations, :start_date_field, :start_time_field, :end_date_field, :end_time_field, :event_id)
  end
end
