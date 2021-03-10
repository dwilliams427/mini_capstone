class Api::OrdersController < ApplicationController
  def index
    # if current_user
    @order = current_user.orders
    render "index.json.jb"
    # else
    #   render json: [message: "must be logged in"]
    # end
  end

  def create
    # if current_user

    product = Product.find_by(id: params[:product_id])

    #compute total, subtotal, tax --> move to model after
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )

    @order.save
    render "show.json.jb"

    #happy/sad path
    # if @order.save
    #   # render "show.json.jb"             #happy path
    #   render json: { message: "Thanks for your money" }
    # else
    #   render json: { errors: @order.errors.full_messages }, status: 406                       #sad path
    # end
    # else
    #   render json: []
    # end
  end

  def show
    order_id = params[:id]
    @order = current_user.orders.find(order_id)
    render "show.json.jb"
  end
end
