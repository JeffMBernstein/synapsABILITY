require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "username cannot be blank" do
  	user = User.new(username: "")
  	assert user.invalid?
  	assert user.errors[:username].any?
  end

  test "first name cannot be blank" do
  	user = User.new(first_name: "")
  	assert user.invalid?
  	assert user.errors[:first_name].any?
  end

  test "last name cannot be blank" do
  	user = User.new(last_name: "")
  	assert user.invalid?
  	assert user.errors[:last_name].any?
  end

  test "email cannot be blank" do
  	user = User.new(email: "")
  	assert user.invalid?
  	assert user.errors[:email].any?
  end

  test "username cannot be a duplicate" do
  	user = User.new(username: users(:one).username,first_name: "Jeff", last_name: "Bernstein", email: "Jeff@Bernstein.com")
  	assert user.invalid?
  	assert user.errors[:username].any?
  end

  test "email cannot be a duplicate" do
  	user = User.new(username: "Ronathan", first_name: "Jeff", last_name: "Bernstein", email: users(:one).email)
  	assert user.invalid?
  	assert user.errors[:email].any?
  end

  test "passwords must match" do
  	user = User.new(username: "Ronathan", email: "Jeff", first_name: "Jeff", last_name: "Bernstein", email: "Jeff@Bernstein.com", password: "foo", password_confirmation: "bar")
  	assert user.invalid?
  end

end
