class User < ApplicationRecord
  has_many :purchases
  has_many :redemptions

  def remaining_kisses
    purchases.joins(:product).sum(:kiss_count) - redemptions.sum(:kisses_redeemed)
  end
end
