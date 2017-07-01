class CreateRedemptions < ActiveRecord::Migration[5.1]
  def change
    create_table :redemptions do |t|
      t.integer :kisses_redeemed

      t.timestamps
    end
  end
end
