class Product < ApplicationRecord
  #replaces model methods
  belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

  #VALIDATIONS
  # validates :name, presence: true
  # validates :name, uniqueness: true

  # validates :image_url, presence: true
  # validates :image_url, uniqueness: true

  # validates :inventory, presence: true
  # validates :inventory, numericality: { only_integer: true }
  # validates :inventory, numericality: { greater_than: 0 }

  # validates :price, numericality: true
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }

  # validates :description, presence: true
  # validates :description, uniqueness: true

  # this helper method eleminates the following method
  # has_many :categories, through: :category_products
  # irrelevant
  # def categories
  #   category_products.map do |product_category|
  #     product_category.category
  #   end
  # end

  #EXAMPLE MODEL METHODS
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.where(product_id: id)
  # end

  # def is_discounted?
  #   price <= 10 #no need for ternary, simply returns true or false
  # end

  # def total
  #   price + tax
  # end

  # def tax
  #   price * 0.09
  # end
end
