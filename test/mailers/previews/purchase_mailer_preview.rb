# Preview all emails at http://localhost:3000/rails/mailers/purchase_mailer
class PurchaseMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/purchase_mailer/redemption_reminder_email
  def redemption_reminder_email
    PurchaseMailer.redemption_reminder_email
  end

end
