class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.string :stripe_charge_id, null: false
      t.references :product, foreign_key: true, null: false

      t.timestamps
    end
    add_index :purchases, :stripe_charge_id, unique: true
  end
end
