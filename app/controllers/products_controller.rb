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
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
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
