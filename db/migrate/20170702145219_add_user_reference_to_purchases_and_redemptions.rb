class AddUserReferenceToPurchasesAndRedemptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchases, :user, foreign_key: true, null: false
    add_reference :redemptions, :user, foreign_key: true, null: false
  end
end
