class OrdersController < ApplicationController
  def create
    order = Order.create(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      stock_status: params[:stock_status],
      delivery_time: params[:delivery_time],
      user_id: current_user.id
    )
    
    flash[:success] = "Product successfully created!"
    redirect_to "/products/#{product.id}"
  end

  def show
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end
end
