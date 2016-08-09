class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories , through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products

validates :name, presence: true
validates :description, length: { maximum: 500 }
validates :price, numericality: true



  def  sales_message
    price.to_f < 2.0 ? "Discount item!" : "Not on sale!"
  end

  def tax
    (price.to_f * 0.09).round(2)
  end

  def total
    (tax + price.to_f).round(2)
  end
end
