class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  before_filter :authenticate, only: [:new, :create]
  before_filter :authorize, only: [:show]

  Stripe.api_key = "sk_test_rEz8kJtSOOxFaxxCZhjXXn2W"

  def show
  end
  
  def new
  	@order = Order.new
  end

  def create
  	cart = current_cart
    @order = Order.new(shipping_address: cart.shipping_address,
      cart: cart)

    if @order.save!
      #customer = Stripe::Customer.create(
       # :email => @order.user_email,
       # :card  => params[:stripeToken] || 'Failure'
      #)

      charge = Stripe::Charge.create(
      	:card  => params[:stripeToken],
      	:amount      => @order.amount,
      	:description => "Order for #{@order.user_email}",
      	:currency    => 'usd'
  	  )

  	  @order.update_attributes(status: 'PAID')
      redirect_to @order
    end
  rescue Stripe::CardError
    @order.update_attributes(status: 'PAYMENT_FAILED')
    flash[:alert] = e.message
    redirect_to @order
  end

  def authorize
    @order = Order.find(params[:id])
    unless current_user == @order.user
      redirect_to current_cart
    end
  end
end