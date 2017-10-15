require 'test_helper'

class ArchitectTest < ActiveSupport::TestCase
  test "sorts buildings by address" do
    one = architects(:one)
    assert_equal one.buildings.first.address1, "1234 5th street"
    assert_equal one.buildings.last.address1,  "1234 6th street"
  end
end
