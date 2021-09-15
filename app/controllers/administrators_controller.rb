class AdministratorsController < ApplicationController
  skip_load_and_authorize_resource
  before_action :set_administrator, only: %i[show edit update destroy]
  layout 'super_admin'

  def index
    authorize! :index, User
    @pagy, @administrators = pagy(UsersQuery.administrators)
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

  def bussiness
    @pagy, @companies = pagy(Company.includes(:category))
  end

  def inventory
    @pagy, @companies = pagy(Company.all)
  end

  def product_company
    @pagy, @products = pagy(Product.where(company_id: params[:company_id]))
    @companies = Company.find(params[:company_id])
  end

  private

  def set_administrator
    @administrator = User.find(params[:id])
  end

  def administrator_params
    params.require(:user).permit(:name, :email, :password)
  end

end
