class OrdersController < ApplicationController
  def create
    @carted_products = CartedProduct.where("status LIKE ? AND user_id = ?", "In Cart", current_user.id)

    subtotal = 0

    @carted_products.each do |carted_product|
      subtotal = subtotal + (carted_product.product.price * carted_product.quantity)
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    @carted_products.update_all(status: "Purchased", order_id: order.id)
    
    flash[:success] = "You successfully completed the purchase!"
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
