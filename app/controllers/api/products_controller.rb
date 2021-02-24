class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render "all_products.json.jb"
  end

  def megapants
    @megapants = Product.find_by(id: 1)
    render "megapants.json.jb"
  end

  def air_fryer
    @air_fryer = Product.find_by(id: 2)
    render "air_fryer.json.jb"
  end

  def cheese
    @cheese = Product.find_by(id: 3)
    render "cheese.json.jb"
  end
end
