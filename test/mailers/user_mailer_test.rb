require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "ToDoEmpty" do
    mail = UserMailer.ToDoEmpty
    assert_equal "Todoempty", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
