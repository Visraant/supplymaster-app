class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :user_id, :subtotal, :tax, :total, presence: true
  validates :subtotal, :tax, :total, numericality: true
  
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
