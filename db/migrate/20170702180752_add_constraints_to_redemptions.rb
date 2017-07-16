class AddConstraintsToRedemptions < ActiveRecord::Migration[5.1]
  def change
    change_column_null :redemptions, :kisses_redeemed, false
  end
end
