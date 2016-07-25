class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @message = "Your product has been created successfully!"
    @product.save
    flash[:success] = "Product was successfully created!"
    redirect_to "/products/#{@product.id}"
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
    name: params[:name],
    price: params[:price],
    image: params[:image],
    description: params[:description]
    )
    flash[:success] = "Your product was updated successfully!"
     redirect_to "/products/#{@product.id}"
  end

  def delete
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products/"
  end

end
