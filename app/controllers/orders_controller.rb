class OrdersController < ApplicationController

  def create
    @product = Product.find_by(id: params[:product_id])
    @order = Order.new(
      quantity: params[:quantity],
      user_id: current_user.id,
      product_id: params[:product_id],
      subtotal: @product.price * params[:quantity].to_i,
      tax: (@product.price * params[:quantity].to_i) * 0.09,
      total: ((@product.price * params[:quantity].to_i) * 0.09) + (@product.price * params[:quantity].to_i)
      )


    @order.save
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order= Order.find_by(id: params[:id])
  end
end
