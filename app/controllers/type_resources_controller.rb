class TypeResourcesController < ApplicationController
  before_action :set_type_resource, only: [:show, :edit, :update, :destroy]

  # GET /type_resources
  # GET /type_resources.json
  def index
    @type_resources = TypeResource.all
  end

  # GET /type_resources/1
  # GET /type_resources/1.json
  def show
  end

  # GET /type_resources/new
  def new
    @type_resource = TypeResource.new
  end

  # GET /type_resources/1/edit
  def edit
  end

  # POST /type_resources
  # POST /type_resources.json
  def create
    @type_resource = TypeResource.new(type_resource_params)

    respond_to do |format|
      if @type_resource.save
        format.html { redirect_to @type_resource, notice: 'EL tipo de recurso fue cread éxitosamente.' }
        format.json { render :show, status: :created, location: @type_resource }
      else
        format.html { render :new }
        format.json { render json: @type_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_resources/1
  # PATCH/PUT /type_resources/1.json
  def update
    respond_to do |format|
      if @type_resource.update(type_resource_params)
        format.html { redirect_to @type_resource, notice: 'EL tipo de recurso fue modificado éxitosamente.' }
        format.json { render :show, status: :ok, location: @type_resource }
      else
        format.html { render :edit }
        format.json { render json: @type_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_resources/1
  # DELETE /type_resources/1.json
  def destroy
    @type_resource.destroy
    respond_to do |format|
      format.html { redirect_to type_resources_url, notice: 'EL tipo de recurso fue eliminado éxitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_resource
      @type_resource = TypeResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_resource_params
      params.require(:type_resource).permit(:code, :name, :pedagogic, :movil)
    end
end
