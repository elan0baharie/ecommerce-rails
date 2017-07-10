class ProductsController < ApplicationController
  before_action :authorize, only: [:secret]

  def secret
  end

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def list
    @products = Product.all
  end
end
