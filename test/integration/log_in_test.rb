require 'test_helper'

class LogInTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:mecheal)
  end

  test "valid information should log in successfully and then log_out" do
    get login_path
    post sessions_path,params: {
        session: {
            email: @user.email,
            password: "password"
        }
    }
    assert_redirected_to user_path(@user)
    follow_redirect!
    assert_select "div.alert-success"
    assert is_logged_in?
    delete session_path(@user)
    assert_redirected_to root_path
    follow_redirect!
    assert_not flash[:user_id]
    assert_not is_logged_in?
  end

  test "invalid information should not log in" do
    get login_path
    post sessions_path,params:{
        session: {
            email: "123@123.com",
            password: "123456"
        }
    }
    assert_template "sessions/new"
    assert_select "div.alert-danger"
  end
end
