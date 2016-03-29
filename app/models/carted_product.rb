class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :order

  validates :status, presence: true
  validates :status, inclusion: {in: ["In Cart", "Purchased", "Removed"], message: "%{value} is not a valid status"}
end
