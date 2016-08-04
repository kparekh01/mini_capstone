class ImagesController < ApplicationController

  def new
  end

  def create
    image = Image.new(image_url: params[:image_url], product_id: params[:product][:product_id] )
    image.save
    flash[:success] = "Image was successfully added."
    redirect_to '/images/new'
  end
end
