class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @images = Image.where(product_id: @product.id)
  end

  def new
  end

end
