class AddConstraintsToProducts < ActiveRecord::Migration[5.1]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :kiss_count, false
    change_column_null :products, :price, false
  end
end
