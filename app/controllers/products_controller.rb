class ProductsController < ApplicationController
  def index
    @products = Product.all
    if params[:sort]
      @products = Product.order(params[:sort])
    elsif params[:desc]
      @products = Product.order(params[:desc] => :desc)
    elsif params[:discount]
      @products = Product.where("#{params[:discount]} < ?", 3000)
    elsif params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description])
    @message = "Your product has been created successfully!"
    @product.save
    flash[:success] = "Product was successfully created!"
    redirect_to "/products/#{@product.id}"
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
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

  def search
    @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    render 'index.html.erb'
  end
end
