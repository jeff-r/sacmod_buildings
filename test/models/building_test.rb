require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  test "versions" do
    building = Building.new
    building.architect = architects(:one)
    building.save
    building.update_attributes(address1: "aaaa")
  end
  # test "the truth" do
  #   assert true
  # end
end
