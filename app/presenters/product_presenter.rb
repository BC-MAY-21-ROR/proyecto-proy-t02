class ProductPresenter
  def initialize(product)
    @product = product
  end

  def availity
    @product.quantity > 0 ? 'Disponible' : 'No disponible'
  end

  def availity_color
    @product.quantity > 0 ? 'text-green-600' : 'text-red-600'
  end
end