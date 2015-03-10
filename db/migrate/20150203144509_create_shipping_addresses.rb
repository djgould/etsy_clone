class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :user_id
      t.string :full_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end
