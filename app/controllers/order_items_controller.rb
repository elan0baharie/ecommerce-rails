class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order.account_id = current_user.id
    puts "Here"
    puts @order.account_id
    @item = @order.order_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private
  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
