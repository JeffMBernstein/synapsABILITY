require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get new session" do
    get :new_session
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_equal session[:user_id], nil
    assert_redirected_to login_path
  end

  test "create with invalid email and password renders errors" do
    post :create_session, user: {email: "foo", password: "bar"}
    assert_equal flash[:error], "Invalid Login."
    assert_redirected_to login_path
  end

  test "create with valid email and password sets session id" do
    user = users(:one)
    post :create_session, user: { email: user.email, password_digest: user.password_digest }
    assert_equal session[:user_id], user.id
    assert_redirected_to users_path
  end
end
