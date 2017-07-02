class User < ApplicationRecord
  has_many :purchases
  has_many :redemptions

  def self.find_or_create_from_omniauth_payload(auth)
    existing_user_from_oauth(auth) || create_user_from_oauth(auth)
  end

  def self.existing_user_from_oauth(auth)
    find_by(oauth_id: auth.uid)
  end

  def self.create_user_from_oauth(auth)
    User.create!(
      oauth_id: auth.uid,
      oauth_token: auth.credentials.token,
      name: auth.info.name,
      email: auth.info.email,
    )
  end

  def remaining_kisses
    purchases.joins(:product).sum(:kiss_count) - redemptions.sum(:kisses_redeemed)
  end
end
