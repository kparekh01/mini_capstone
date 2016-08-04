class CartedProductsControllerController < ApplicationController

  def create
    @cart = carted_products.new()
  end
end
