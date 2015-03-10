class Item < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :product_id, presence: :true

  def name
  	product.name
  end

  def description
  	product.description
  end

  def price
  	product.price
  end
  
  def total
  	self.quantity * product.price
  end
end
