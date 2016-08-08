class CartedProductsController < ApplicationController

  def create
    @carted = CartedProduct.new(
    user_id: current_user.id,
    product_id: params[:product_id],
    quantity: params[:quantity],
    status: "carted"
    )
    @carted.save
    redirect_to "/carted_products"
  end


  def index
    @carted= CartedProduct.where(user_id: current_user.id, status: "carted")
    if @carted.count == 0
      redirect_to "/products"
    else
      render "index.html.erb"
    end
  end

  def update
    @deleted_product = CartedProduct.find_by(id: params[:id])
    @deleted_product.update(status: "Removed")
    flash[:success] = "Your product was successfully removed from your cart!"
     redirect_to "/carted_products"
  end
end
