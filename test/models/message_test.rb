require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "subject cannot be blank" do
  	message = Message.new(subject: "")
  	assert message.invalid?
  	assert message.errors[:subject].any?
  end

  test "body cannot be blank" do
  	message = Message.new(body: "")
  	assert message.invalid?
  	assert message.errors[:body].any?
  end

  test "has to be sent to one user" do
  	message = Message.new(sender_id: nil)
  	assert message.invalid?
  	assert message.errors[:sender_id].any?
  end
end
