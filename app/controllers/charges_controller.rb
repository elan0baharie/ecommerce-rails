class ChargesController < ApplicationController
  def new
    @amount = current_order.total_price
    @order = current_order
  end

  def index

  end

  def create
    # Amount in cents
      @order = current_order
    @amount = current_order.total_price.to_i()*100
    puts @amount
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
