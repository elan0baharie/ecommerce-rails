class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @user = current_user
  end

  def create

  end

  def update
    @order = current_order

    if @order.update(order_params)
      session[:order_id] = nil
      redirect_to '/'
    else
      redirect_to '/test'
    end
  end

  private
    def order_params
      params.require(:order).permit(:status, :total_price)
    end
end
