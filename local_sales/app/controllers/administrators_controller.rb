class AdministratorsController < ApplicationController
  before_action :set_administrator, only: %i[show edit update destroy]

  def index
    @administrators = UsersQuery.administrators
  end

  def new
    @administrator = User.new
  end

  def create
    @administrator = User.new(administator_params)
    if @administrator.save
      redirect_to administrators_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @administrator.update(administator_params)
      redirect_to administrators_path
    else
      render :edit
    end
  end

  def destroy
    @administrator.destroy
    redirect_to administrators_path
  end

  private

  def administator_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_administrator
    @administrator = User.find(params[:id])
  end
end
