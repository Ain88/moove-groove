require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @activity = Activity.new(:name => "test",
            :calories => 50,
            :description => "random")
  end

  test "activity test should be valid" do
    assert @activity.valid?
  end
end
