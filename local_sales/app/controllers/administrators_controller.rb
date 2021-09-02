class AdministratorsController < ApplicationController
  skip_load_and_authorize_resource
  before_action :set_administrator, only: %i[show edit update destroy]

  def index
    authorize! :index, User
    @administrators = UsersQuery.administrators
  end

  def new
    authorize! :create, User
    @administrator = User.new
  end

  def create
    authorize! :create, User
    @administrator = User.new(administrator_params)
    if @administrator.save
      redirect_to administrators_path
    else
      render :new
    end
  end

  def show
    authorize! :read, User
  end

  def edit
    authorize! :update, User
  end

  def update
    authorize! :update, User
    if @administrator.update(administrator_params)
      redirect_to administrators_path
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, User
    @administrator.destroy
    redirect_to administrators_path
  end

  private

  def administrator_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_administrator
    @administrator = User.find(params[:id])
  end
end
