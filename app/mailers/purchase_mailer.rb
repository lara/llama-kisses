class PurchaseMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_mailer.redemption_reminder_email.subject
  #

  def purchase_reminder_email(user)
    @user = user
    mail to: user.email
  end

  def redemption_reminder_email(purchase)
    @purchase = purchase
    @user = purchase.user
    mail to: @user.email
  end
end
