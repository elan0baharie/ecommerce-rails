class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    testy = params
    p testy
    redirect_to root
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
