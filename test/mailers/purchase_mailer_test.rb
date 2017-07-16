require 'test_helper'

class PurchaseMailerTest < ActionMailer::TestCase
  test "redemption_reminder_email" do
    mail = PurchaseMailer.redemption_reminder_email
    assert_equal "Redemption reminder email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
