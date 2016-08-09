class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :subtotal, numericality: true
  validates :tax, numericality: true
  validates :total, numericality: true
end
