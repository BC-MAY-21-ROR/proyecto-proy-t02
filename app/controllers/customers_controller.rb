class CustomersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_load_and_authorize_resource

  def index
    @categories = Category.limit(2)
    @featured_products = Product.all
  end

  def show 
    @product = Product.includes(:company).find(params[:id])
    @product_presenter = ProductPresenter.new(@product)
  end

  def product_results
    @product = params[:name]
    @results = ProductsQuery.search_product(@product)
  end
end
