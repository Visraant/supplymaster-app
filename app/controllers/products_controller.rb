class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def show
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)
  end

  # def threedprinter
  #   @threedprinter = Product.find_by(id: 2)
  #   render "threedprinter.html.erb"
  # end

  # def pvc
  #   @pvc = Product.find_by(id: 3)
  #   render "pvc.html.erb"
  # end
end
