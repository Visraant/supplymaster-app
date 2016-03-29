class Product < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :user
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products

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

  def printable_category_names
    # names = []
    # categories.each do |category|
    #   names << category.name
    # end
    # names.join(", ")
    names = categories.map { |category| category.name }.join(", ")
  end
end
