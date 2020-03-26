class ProductsController < ApplicationController
  def index
    @Products = Product.all.order("created_at DESC").where(purchase_status: "出品中­")
  end

  def show
  end

  def new
  end

end
