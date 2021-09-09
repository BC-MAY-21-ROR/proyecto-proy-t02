class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update]

  # GET /products
  def index
    @pagy, @products = pagy(Product.all)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.company_id = 1 # TODO: Assign company_id according to previous company selection
    if @product.save
      flash[:success] = 'product was successfully created'
      redirect_to products_path
    else
      flash[:error] = 'product was not created'
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      flash[:success] = 'product was successfully updated'
      redirect_to products_path
    else
      flash[:error] = 'product was not updated'
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :product_img, :company_id)
  end
end
