class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :carted_products
  has_many :products, through: :carted_products
  
  def subtotal_calc
    quantity * product.price
  end 

  def order_tax
    product.tax * quantity
  end

  def order_total
    order_tax + subtotal_calc
  end
end
