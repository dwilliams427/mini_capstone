class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  # def get_single_product
  #   get_product = params[:product]
  #   @product = Product.find_by(name: get_product)
  #   render "show.json.jb"
  # end

  # def all_products_query
  #   get_product = params[:product]
  #   @product = Product.find_by(name: get_product)
  #   render "show.json.jb"
  # end

  def index
    @product = Product.all
    if params[:category]
      category = Category.find_by(name: params[:category])
      @product = category.products
    end
    render "index.json.jb"
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
    @product = Product.find_by(id: params[:id])

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
    @product = Product.find_by(id: params[:id])

    if @product.destroy
      render json: { message: "deleted product" }
    else
      render json: { errors: @product.errors.full_messages }, status: 406                       #sad path
    end
  end
end
