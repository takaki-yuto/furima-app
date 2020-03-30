class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.includes(:images).order("created_at DESC")
  end

  def show
    @images = @product.images
  end

  def new
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
  
end
