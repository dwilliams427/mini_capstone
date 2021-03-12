class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  # def products
  #   category_products.map do |product_category|
  #     product_category.product
  #   end
  # end
end
