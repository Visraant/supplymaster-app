class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images

  def sale_message
    if price <= 2
      "Discount item!"
    else
      "On sale!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
