class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_card,only: [:buy, :purchase]
  
  require 'payjp'

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
  end

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
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

  def edit
  end

  def buy
    @images = @product.images
    @residence = Residence.find_by(user_id: current_user.id)
    #Payjpの秘密鍵を取得
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def purchase
    Payjp.api_key =  ENV["PAYJP_ACCESS_KEY"]
    charge = Payjp::Charge.create(
      amount: @product.selling_price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
    )
    @product.update(buyer_id: current_user.id, purchase_status: "売り切れ")
    redirect_to purchased_product_path
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
                                    :bland_name, :selling_price, :category_id,
                                    images_attributes: [:id, :image, :_destroy ]).merge(seller_id: current_user.id)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end
