class CartedProductsController < ApplicationController
  def index
    if current_user
      @carted_products = CartedProduct.where("status LIKE ? AND user_id = ?", "In Cart", current_user.id)
    else
      redirect_to '/users/sign_up'
    end
  end

  def create
    cartedproduct = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status]
    )
    # cartedproduct.update(
    #   subtotal: order.subtotal_calc,
    #   tax: order.order_tax,
    #   total: order.order_total)
    # flash[:success] = "You bought this product!"
    flash[:success] = "You added this to your cart!"
    redirect_to "/products/#{params[:product_id]}"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])

    carted_product.update(status: "Removed")

    flash[:success] = "Product removed from cart!"
    redirect_to '/carted_products'
  end
end