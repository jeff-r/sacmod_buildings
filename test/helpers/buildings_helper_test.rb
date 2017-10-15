class BuildingHelperTest < ActionView::TestCase
  include BuildingsHelper

  test "showing_older_version?" do
    assert_equal true, BuildingsController.helpers.showing_older_version?(1)
  end

  test "doesn't show link to nonexistent versions" do
    assert_nil building_versions_link(buildings(:one))
  end

  test "shows link to show previous versions" do
    building = buildings(:one)
    building.update_attributes(address1: "aaa")
    assert_dom_equal %{<a href=\"/buildings/#{building.id}/versions\">Show versions</a>}, building_versions_link(building)
  end
end
