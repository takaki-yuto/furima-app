class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:destroy]
  
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

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end

  end

  
  def destroy
    @product.destroy
    redirect_to root_path
  end


  private

  def product_params
    params.require(:product).permit(:name, :text, :size_id, :products_status_id, :shipping_charges_id, 
                                    :shipping_method_id, :delivery_area_id, :estimated_delivery_date_id, 
                                    :bland_name_id, :selling_price,
                                    images_attributes: [:id, :image, :_destroy ]).merge(seller_id: current_user.id )
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
