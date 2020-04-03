class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.includes(:images).order("created_at DESC")
  end

  def show
    @images = @product.images
  end

  def new
    @product = Product.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift('---')
  end
 
  def get_category_children
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
 
  def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
  
end
