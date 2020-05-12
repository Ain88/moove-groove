require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  def setup
    @user = User.new(:email => "test-email22@hotmail.com",
            :first_name => "test22",
            :last_name => "test22",
            :weight => "50",
            :password =>"password")
    @activity = Activity.new(:name => "test",
            :calories => 50,
            :description => "random")
    @user.save
    @activity.save
    @record = Record.new(:user_id => @user.id,
      :activity_id => @activity.id,
      :activity_date => "2020-05-11",
      :duration => 15,
      :total_calories => 41 )
  end

  test "record test should be valid" do
    assert @record.valid?
  end
end
