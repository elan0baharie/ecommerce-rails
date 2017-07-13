class ProductsController < ApplicationController
  before_action :authorize, only: [:secret]

  def secret
  end

  def index
    @products = Product.all
    @product = Product.new
    @order_item = current_order.order_items.new
    @user = current_user
  end

  def list
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :sale, :sale_amount)
    end
end
