class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_carted_products

  def get_carted_products
    if current_user
    @carted_products = CartedProduct.where("status LIKE ? AND user_id = ?", "In Cart", current_user.id)
  else
    @carted_products = 0
  end
  end
end
