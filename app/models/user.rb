class User < ActiveRecord::Base
  has_secure_password

  has_many :orders
  has_many :carted_products

  validates :name, presence: true
  validates :password, length: { in: 6..20 }
  validates :email, uniqueness: true
end
