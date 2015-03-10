class ShippingAddressesController < ApplicationController  
  def new
  	@shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
  	@user = current_user
  	@shipping_address = @user.shipping_addresses.build(shipping_address_params)
  	
  	if @shipping_address.save
  	  redirect_to new_shipping_address_order_path(@shipping_address)
  	else
  	  flash[:error]
  	  render 'new'
  	end
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:full_name, :street_address, :city, :state, :zipcode, :country, :phone_number)
  end
end