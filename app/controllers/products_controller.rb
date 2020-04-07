class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:destroy]
  require 'payjp'

  def index
    @products = Product.includes(:images).order("created_at DESC")
  end

  def show
    @images = @product.images
  end

  def new
  end

  def buy
    @product = Product.find(params[:id]) 
    @images = @product.images
    @residence = Residence.find_by(user_id: current_user.id)
    @user = current_user
    @card = Card.find_by(user_id: current_user.id)
    #Payjpの秘密鍵を取得
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = "sk_test_a4d0589cc7b4c72602e62c6a"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def purchase
    @card = Card.find_by(user_id: current_user.id)
    @product = Product.find(params[:id])
    Payjp.api_key =  "sk_test_a4d0589cc7b4c72602e62c6a"
    charge = Payjp::Charge.create(
      amount: @product.selling_price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
    )
    @product_buyer= Product.find(params[:id])
    @product_buyer.update(buyer_id: current_user.id, purchase_status: "売り切れ")
    redirect_to purchased_product_path
  end 

  def destroy
    @product.destroy
    redirect_to root_path
  end

  
  private
  def set_product
    @product = Product.find(params[:id]) 
  end
  
end
