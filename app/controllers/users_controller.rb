class UsersController < ApplicationController
  #include JqueryValidate
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :can_access

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "El usuario #{@user.email} fue creado con éxito!" }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @user_params = ( params[:user][:password].empty? ) ? user_params_whitnot_password : user_params
      if @user.update(@user_params)
        format.html { redirect_to @user, notice: 'El usuario se ha actualizado correctamente!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password,
                       :password_confirmation, :admin, :status)
    end

    def user_params_whitnot_password
      params.require(:user).permit(:first_name, :last_name, :email, :admin, :status)
    end
end

