class AddQuantityToItems < ActiveRecord::Migration
  def change
  	add_column :items, :quantity, :integer, default: 1
  end
end
