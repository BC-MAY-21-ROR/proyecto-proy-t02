class CustomersController < ApplicationController
  def index
    @categories = Category.limit(2)
    @featured_products = Product.all
  end
end
