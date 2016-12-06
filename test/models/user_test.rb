require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "wusheng",email: "th@live.cn", password: "123456",password_confirmation: "123456")
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
    duplicate_user = @user.dup
    duplicate_user.email.upcase!
    assert_not duplicate_user.valid?
  end

  test "password should longger than 5" do
    @user.password = @user.password_confirmation = "12345"
    assert_not @user.valid?
  end

  test "invalid email should not pass" do
    invalid_emails = %w"123@123 www@.com www@@live.cn www@.com"
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?,"#{invalid_email} should not be valid"
    end
  end

  test "valid email should pass" do
    valid_emails = %w"th@live.cn W.c@live.cn w+x.@live.cn"
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?,"#{valid_email} should be valid"
    end
  end
end
