class ChangeItemQuantityDefault < ActiveRecord::Migration
  def change
  	change_column_default :items, :quantity, 0
  end
end
