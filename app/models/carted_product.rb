class CartedProduct < ActiveRecord::Base
  has_many :products
  has_many :orders
  has_many :users, through: :orders
end
