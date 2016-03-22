class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
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
