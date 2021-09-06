class ProductsQuery
  def self.search_product(name)
    Product.where('LOWER(name) LIKE LOWER(?)', "%#{name}%")
  end
end
