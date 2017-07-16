class RemindUserToPurchaseWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    return if user.purchases.any?
    PurchaseMailer.purchase_reminder_email(user).deliver_now
  end
end
