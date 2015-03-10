class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :shipping_address_id
      t.integer :cart_id
      t.string :status

      t.timestamps
    end
  end
end
