class ProductsController < ApplicationController
  before_action :authorize, only: [:secret]

  def secret
  end

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @user = current_user
  end

  def list
    @products = Product.all
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
