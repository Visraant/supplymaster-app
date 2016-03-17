class ProductsController < ApplicationController
  def index
    @products = Product.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    if sort && sort_order
      @products = Product.order(sort => sort_order)
    end
    discount_item = params[:discount_item]
    product_price = params[:price]
    if product_price <= 5
      @product.price = Product.order(product_price)
    end
    render "index.html.erb"
  end

  def new
  end

  def create
    product = Product.create(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      stock_status: params[:stock_status],
      delivery_time: params[:delivery_time]
    )
    flash[:success] = "Product successfully created!"
    redirect_to "/products/#{product.id}"
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
    flash[:success] = "Product successfully updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:success] = "Product successfully deleted!"
    redirect_to "/products"
  end
end
