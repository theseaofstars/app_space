require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "wusheng",email: "th@live.cn",
    password: "123456",password_confirmation: "123456")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should not be empty" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should not be empty" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "user name should shorter than 50" do
    @user.name = "a"*51
    assert_not @user.valid?
  end

  test "user email should shorter than 254" do
    @user.email = "a"*255
    assert_not @user.valid?
  end

  test "user email should be unique" do
    @user.save
    assert_not @user.valid?
  end
end
