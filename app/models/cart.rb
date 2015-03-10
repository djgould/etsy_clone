class Cart < ActiveRecord::Base
  has_many :items
  belongs_to :user

  def already_has_product?(product_id)
  	items.where(product_id: product_id).length > 0
  end

  def product_item(product_id)
  	item = items.where(product_id: product_id).first
  end

  def shipping_address
    user.shipping_addresses.first
  end

  def total
  	sum = 0
  	items.each do |item|
  		sum += item.total
  	end
  	sum
  end
end
