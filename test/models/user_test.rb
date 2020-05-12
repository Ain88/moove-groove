require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(:email => "test-email22@hotmail.com",
            :first_name => "test22",
            :last_name => "test22",
            :weight => "50",
            :password =>"password")
  end

  test "user test should be valid" do
    assert @user.valid?
  end

  test "email should be unique" do
    @user.save
    user2 = User.new(:email => "test-email22@hotmail.com",
            :first_name => "test33",
            :last_name => "test33",
            :weight => "50",
            :password =>"password")
    assert_not user2.valid?
  end

  test "user password should be more than 6 characters" do
    @user.password = 1234
    assert_not @user.valid?
  end

  test "user weight should not be valid" do
    @user.weight = 55555555
    assert_not @user.valid?
  end

  test "user first name should not be valid" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "user last name should not be valid" do
    @user.last_name = "userslastnamethatstoolong"
    assert_not @user.valid?
  end

end
