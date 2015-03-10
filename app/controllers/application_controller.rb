class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart
  respond_to :html, :json
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = current_user.carts.create
    session[:cart_id] = cart.id
    cart
  end

  def find_or_create_item(cart)
    if cart.already_has_product?(params[:product_id])
      item = cart.product_item(params[:product_id])
    else
      item = cart.items.build(product_id: params[:product_id])
    end
    item
  end

  def authenticate
    unless user_signed_in?
      redirect_to sign_in_path
    end
  end
end
