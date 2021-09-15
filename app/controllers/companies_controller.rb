class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @pagy, @companies = pagy(Company.all)
  end

  def new
    @company = Company.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
      if @company.save
        flash[:notice] = 'Company was successfully created'
        redirect_to companies_path
      else
        flash[:notice] = 'Company was not created'
        render :new
    end
  end

  def update
      if @company.update(company_params)
        flash[:notice] = 'Company was successfully updated'
        redirect_to companies_path
      else
        flash[:notice] = 'Company was not updated'
        render :edit
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private 
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :address, :phone, :company_img, :category_id, :town_id, user_id: current_user)
  end
end
