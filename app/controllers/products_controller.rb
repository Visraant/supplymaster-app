class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def new
  end

  def create
    Product.create(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      stock_status: params[:stock_status],
      delivery_time: params[:delivery_time]
    )
    redirect_to '/products'
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      stock_status: params[:stock_status],
      delivery_time: params[:delivery_time]
    )
    redirect_to '/products'
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    redirect_to '/products'
  end
end
