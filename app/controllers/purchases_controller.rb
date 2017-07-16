class PurchasesController < ApplicationController
  def home
    @products = Product.order(:price)
  end

  def index
    @purchases = current_user.purchases.order(created_at: :desc).includes(:product)
  end

  def create
    token = params[:stripeToken]
    product = Product.find(params[:product_id])

    charge = Stripe::Charge.create(
      amount: product.price,
      currency: "usd",
      description: "#{product.name} - #{product.kiss_count} llama kisses",
      source: token,
    )

    current_user.purchases.create!(
      product: product,
      stripe_charge_id: charge.id,
    )

    PurchaseMailer.redemption_reminder_email(current_user.purchases.last).deliver_later(wait: 1.day)
  end

  private

  def total_kisses_purchased
    Purchase.joins(:product).sum(:kiss_count)
  end

  def total_kisses_redeemed
    Redemption.sum(:kisses_redeemed)
  end
end
