class ProductsController < ApplicationController
  def index
    @products = Product.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    if sort && sort_order
      @products = Product.order(sort => sort_order)
    end
    if params[:discount] == "true"
      @products = Product.where("price < ?", 5)
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
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
      @product = Product.find_by(id: params[:id])
    end
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

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render 'index.html.erb'
  end
end
