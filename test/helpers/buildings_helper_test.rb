class BuildingHelperTest < ActionView::TestCase
  include BuildingsHelper

  test "showing_older_version?" do
    assert_equal true, BuildingsController.helpers.showing_older_version?(1)
  end

  test "doesn't show link to nonexistent versions" do
    assert_nil building_versions_link(buildings(:one))
  end

  test "shows link to show previous versions" do
    # building = buildings(:one)
    # building.update_attributes(address1: "aaa")
    # assert_dom_equal %{<a href=\"/buildings/#{building.id}/versions\">Show versions</a>}, building_versions_link(building)
  end

  test "returns gsv if available" do
    building = buildings(:one)
    assert_dom_equal %{<img src="https://goo.gl/maps/GsCn9EsoTK22" />}, google_street_view_tag(building)
  end

  test "google street view shows default if not available" do
    building = buildings(:two)
    assert_dom_equal %{<img src="https://maps.googleapis.com/maps/api/streetview?size=390x330&location=2345 6th street, city 2 22222&key=AIzaSyDIw1nXXMVNjbj3tDNiUKMfjpcL0YEWrvY" alt="Streetview?size=390x330&amp;location=2345 6th street, city 2 22222&amp;key=aizasydiw1nxxmvnjbj3tdniukmfjpcl0yewrvy" />}, google_street_view_tag(building)
  end
end
