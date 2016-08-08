class OrdersController < ApplicationController

  def create
    @product = Product.find_by(id: params[:product_id])
    @selected_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    selected_sub_total = @selected_products.map{|product| product.product.price.to_i * product.quantity}.inject(:+)

    @order = Order.new(user_id: current_user.id)
      @order.subtotal = selected_sub_total
      @order.tax = selected_sub_total * 0.09
      @order.total = selected_sub_total + @order.tax
    @order.save
    @selected_products.each{|product| product.update(order_id: @order.id, status: "Purchased")}
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order= Order.find_by(id: params[:id])
  end
end
