require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "sign_in_email" do
    mail = UserMailer.sign_in_email
    assert_equal "Sign in email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
