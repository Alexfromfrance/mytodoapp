require 'test_helper'

class DailyMailerTest < ActionMailer::TestCase
  test "dailymail" do
    mail = DailyMailer.dailymail
    assert_equal "Dailymail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
