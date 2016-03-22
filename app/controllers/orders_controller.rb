class OrdersController < ApplicationController
  def create
    order = Order.create(
      quantity: params[:quantity],

      # price: params[:price],
      # image: params[:image],
      # description: params[:description],
      # stock_status: params[:stock_status],
      # delivery_time: params[:delivery_time],
      user_id: current_user.id,
      product_id: params[:product_id]
    )
    order.update(
      subtotal: order.subtotal_calc,
      tax: order.order_tax,
      total: order.order_total)
    # flash[:success] = "You bought this product!"
    

    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    # if params[:id] == "random"
    #   orders = Order.all
    #   @order = order.sample
    # else
      # @order = Order.find_by(id: params[:id])
    # end
  end
end
