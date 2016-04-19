class OrderController < ApplicationController
  before_action :authenticate_user!
  def index
    @resource = Resource.new
    @beneficiary = Beneficiary.new
  end

  def create
    @beneficiary = Beneficiary.find(params[:order][:beneficiary_id])
    if params[:typo_beneficio] == "1"
      p 'Eventos'
      if params[:is_list_event] == "on"
        p 'Lista de Eventos'
        params[:order][:events].delete('')
        if params[:order][:events].empty?
          flash[:alert] = "Debe que seleccionar un evento de la lista."
          return render :index
        else
          events = Event.where(id: params[:order][:events])
          @beneficiary.events << events
          if @beneficiary.save
            redirect_to prestamos_path, notice: "Se ha realizado un préstamo y colocado como responsable a <b>#{@beneficiary.complete_name}</b>".html_safe and return
          else
            flash[:alert] = "Ocurrió un problema, no se pudo realizar el préstamo"
            return render :index
          end
        end
      else
        p 'Nuevo evento'
        event = Event.new(event_params)
        @beneficiary.events << event
        if @beneficiary.save
          redirect_to prestamos_path, notice: "Se ha realizado un préstamo y colocado como responsable a <b>#{@beneficiary.complete_name}</b>".html_safe and return
        else
          flash[:alert] = "Ocurrió un problema, no se pudo realizar el préstamo"
          return render :index
        end
      end
    elsif params[:typo_beneficio] == "2"
      p 'Actividades'
      if params[:is_list_activities] == "on"
        p 'Lista de actividades'
        params[:order][:activities].delete('')
        if params[:order][:activities].empty?
          render :index, alert: "Debe que seleccionar una actividad de la lista." and return
        else
          activities = Event.where(id: params[:order][:activities])
          @beneficiary.activities << activities
          if @beneficiary.save
            redirect_to prestamos_path, notice: "Se ha realizado un prestamo y colocado como responsable a <b>#{@beneficiary.complete_name}</b>".html_safe and return
          else
            flash[:alert] = "Ocurrio un problema, no se pudo realizar el prestamo"
            return render :index
          end
        end
      else
        p 'Nueva actividad'
        activity = Activity.new(activity_params)
        @beneficiary.activities << activity
        if @beneficiary.save
          redirect_to prestamos_path, notice: "Se ha realizado un prestamo y colocado como responsable a <b>#{@beneficiary.complete_name}</b>".html_safe and return
        else
          flash[:alert] = "Ocurrio un problema, no se pudo realizar el prestamo"
          return render :index
        end
      end
    end
    render :index, alert: msg
  end

  private
  def activity_params
    params.require(:activity).permit(:code, :description, :start_date_field, :start_time_field, :end_date_field, :end_time_field, :event_id)
  end

  def event_params
    params.require(:event).permit(:code, :description, :observations, :start_date_field, :start_time_field, :end_date_field, :end_time_field, :event_id)
  end
end
