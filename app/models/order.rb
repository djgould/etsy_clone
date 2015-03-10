class Order < ActiveRecord::Base
  belongs_to :shipping_address
  belongs_to :cart
  validates :cart, :shipping_address, presence: true
  
  def user_email
    cart.user.email
  end

  def amount
  	(cart.total * 100).to_i
  end

  def user
  	cart.user
  end
end
