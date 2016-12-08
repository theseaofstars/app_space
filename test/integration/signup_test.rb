require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "valid information should create a user" do
    get signup_path
    assert_difference "User.count",1 do
      post users_path,params: {
          user: {
              name: "test",
              email: "test@live.cn",
              password: "foobar",
              password_confirmation: "foobar"
          }
      }
    end
    follow_redirect!
    assert_template "users/show"
  end

  test "invalid information should not create a user" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path,params:{
          user:{
              name: "test",
              email: "test@invalid",
              password: "123",
              password_confirmation: "123"
          }
      }
    end
    assert_template "users/new"
    assert_select "div#error_explanation"
  end

end
