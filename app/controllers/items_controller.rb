class ItemsController < ApplicationController
  before_filter :authenticate
  
  def create
    @cart = current_cart
    @item = find_or_create_item(@cart)
    @item.quantity += 1
    if @item.save!
      flash[:notify] = "#{@item.product.name} added to cart"
      redirect_to @item.product
    else
      flash[:alert]
      render @item.product
    end
  end

  private

  def item_params
    params.require(:product_id)
  end
end
