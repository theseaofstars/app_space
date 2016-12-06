require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest


  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get edit" do
    get edit_user_path(users(:mecheal))
    assert_response :success
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get show" do
    get user_path(users(:mecheal))
    assert_response :success
  end
/#
  test "should delete a user" do
    user = users(:mecheal)
    assert_difference "User.count",-1 do
      delete users_path,params: {
          user: {
              name: user.name,
              email: user.email,
              password: user.password,
              password_confirmation: user.password_confirmation
          }
      }
    end
  end
#/
/#  test "should create a user" do
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
  end
#/
end
