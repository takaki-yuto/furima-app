class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  
  def index
    @products = Product.includes(:images).order("created_at DESC")
  end

  def show
    @images = @product.images
    @size = Size.find @product.size_id
    @productsStatus = ProductsStatus.find @product.products_status_id
    @shippingCharges = ShippingCharges.find @product.shipping_charges_id
    @shippingMethod = ShippingMethod.find @product.shipping_method_id
    @estimatedDeliveryDate = EstimatedDeliveryDate.find @product.estimated_delivery_date_id
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
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
                                    :bland_name, :selling_price,
                                    images_attributes: [:id, :image, :_destroy ]).merge(seller_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
