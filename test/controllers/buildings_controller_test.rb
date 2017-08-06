require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @building = buildings(:one)
  end

  test "should get index" do
    get buildings_url
    assert_response :success
  end

  test "should get new" do
    get new_building_url
    assert_response :success
  end

  test "should create building" do
    assert_difference('Building.count') do
      post buildings_url, params: { building: { address1: @building.address1, apn: @building.apn, architect_id: @building.architect_id, city: @building.city, family: @building.family, gsv: @building.gsv, key: @building.key, notes: @building.notes, source: @building.source, status: @building.status, building_type: @building.building_type, year: @building.year, zip: @building.zip } }
    end

    assert_redirected_to building_url(Building.last)
  end

  test "should show building" do
    get building_url(@building)
    assert_response :success
  end

  test "should get edit" do
    get edit_building_url(@building)
    assert_response :success
  end

  test "should update building" do
    patch building_url(@building), params: { building: { address1: @building.address1, apn: @building.apn, architect_id: @building.architect_id, city: @building.city, family: @building.family, gsv: @building.gsv, key: @building.key, notes: @building.notes, source: @building.source, status: @building.status, buildingbuilding_type: @building.building_type, year: @building.year, zip: @building.zip } }
    assert_redirected_to building_url(@building)
  end

  test "should destroy building" do
    assert_difference('Building.count', -1) do
      delete building_url(@building)
    end

    assert_redirected_to buildings_url
  end
end
