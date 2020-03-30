class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end

  def new
  end

end
