class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /areas
  # GET /areas.json
  def index
    @areas = Area.all
  end

  def calendar
    @activities = Area.find(params[:area_id]).activities
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas
  # POST /areas.json
  def create
    #return render json: params[:recursos]
    @area = Area.new(area_params)
    @count = 0
    save_multiples_recursos if params[:recursos][:status] == '1'
    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_path, notice: 'El Área fue creada éxitosamente.' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    if params[:recursos][:status] == '1'
      @count = count_of_resource
      save_multiples_recursos
    end
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'El Área fue modificada éxitosamente.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'El Área fue eliminada éxitosamente.' }
      format.json { head :no_content }
    end
  end

  def areas_by
    areas = Area.disponible.where(institute_id: params[:institute_id])
    return render json: areas
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:code, :name, :reservable, :status, :area_id, :institute_id,
                                   resources_attributes: [:id, :code, :name, :description, :movil, :pedagogic, :resource_id, :area_id, :_destroy])
    end

    def save_multiples_recursos
      type_recurso = TypeResource.find(params[:recursos][:multiple_recursos])
      (1..params[:recursos][:cantidad].to_i).each do |e|
        @count+=1
        codigo = "#{type_recurso.code}-#{(sprintf '%03d', @count).to_s}"
        @area.resources.build(code: codigo, name: type_recurso.name, type_resource: type_recurso, movil: type_recurso.movil, pedagogic: type_recurso.pedagogic)
      end
    end

    def count_of_resource
      type_recurso = TypeResource.find(params[:recursos][:multiple_recursos])
      resource = @area.resources.where(resources: {type_resource_id: type_recurso.id})
      if resource.blank?
        return 0
      else
        return resource.last.code.split("-").last.to_i
      end
    end
end
