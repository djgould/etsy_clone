class AddPriceToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :price, :decimal, precision: 8, scale: 2
  end
end
