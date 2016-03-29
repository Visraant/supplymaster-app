class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    # if current_user
    #   @products = current_user.products
    # else
    #   redirect_to "/users/sign_in"
    # end
    @products = Product.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    if sort && sort_order
      @products = Product.order(sort => sort_order)
    end
    if params[:discount] == "true"
      @products = Product.where("price < ?", 5)
    end
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end
  end

  def new
    if current_user && current_user.admin
      render 'new.html.erb'
    else
      redirect_to "/"
    end
  end

  def create
    if current_user && current_user.admin
      product = Product.create(
        name: params[:name],
        price: params[:price],
        # image: params[:image],
        description: params[:description],
        stock_status: params[:stock_status],
        delivery_time: params[:delivery_time],
        user_id: current_user.id
      )
      flash[:success] = "Product successfully created!"
      redirect_to "/products/#{product.id}"

    else
      redirect_to "/"
    end
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
    if current_user && current_user.admin
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
    else
      redirect_to "/"
    end
  end

  def update
    if current_user && current_user.admin
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
    else
      redirect_to "/"
    end
  end

  def destroy
    if current_user && current_user.admin
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
      @product.destroy
      flash[:success] = "Product successfully deleted!"
      redirect_to "/products"
    else
      redirect_to "/"
    end
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render 'index.html.erb'
  end

  private

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end
end
