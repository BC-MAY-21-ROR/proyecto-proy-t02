class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to categories_path
    else
      flash[:notice] = 'Category was not created'
      render :new
    end
  end  

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category was successfully updated'
      redirect_to categories_path
    else
      flash[:notice] = 'Category was not updated'
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Category was succesfully destroyed'
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
