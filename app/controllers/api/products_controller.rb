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

  def get_single_product
    get_product = params[:product]
    @product = Product.find_by(name: get_product)
    render "show.json.jb"
  end

  def all_products_query
    get_product = params[:product]
    @product = Product.find_by(name: get_product)
    render "show.json.jb"
  end

  def index
    if current_user
      @product = Product.all
      render "index.json.jb"
    else
      render json: []
    end
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      # image_url: params[:image_url],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id],
    )

    #happy/sad path
    if @product.save
      render "show.json.jb"             #happy path
    else
      render json: { errors: @product.errors.full_messages }, status: 406                       #sad path
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)

    @product.name = params[:name] || @product.name
    # @product.image_url = params[:image_url] || @product.image_url
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id

    #happy/sad path
    if @product.save
      render "show.json.jb"             #happy path
    else
      render json: { errors: @product.errors.full_messages }, status: 406                       #sad path
    end
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)

    @product.destroy
    render json: { message: "deleted product" }
  end
end
