class CustomersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_load_and_authorize_resource

  def index
    @categories = Category.limit(2)
    @featured_products = Product.all
  end

  def show 
    @product_card = Product.find(params[:id])
    @company = Company.find(@product_card.company_id)
  end

  def product_results
    @product = params[:name]
    @results = ProductsQuery.search_product(@product)
  end
end
