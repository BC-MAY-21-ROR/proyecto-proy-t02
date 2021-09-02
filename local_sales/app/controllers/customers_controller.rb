class CustomersController < ApplicationController
  skip_load_and_authorize_resource
  def index
    @categories = Category.limit(2)
    @featured_products = Product.all
  end
end
