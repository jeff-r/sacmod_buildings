module BuildingsHelper
  def next_building_link(building)
    link_to "next", building.next
  end

  def prev_building_link(building)
    link_to "previous", building.prev
  end

  def google_static_map(center)
    image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17&markers=#{center}"
  end

  def google_embedded_map_via_coords(building)
    iframe = <<-IFRAME
     <iframe width="390" height="330" frameborder="0" style="border:0"
      src="https://www.google.com/maps/embed/v1/place?key=#{api_key}&q=#{building.map_center}"
      allowfullscreen>
     </iframe>
    IFRAME
    iframe.html_safe
  end

  def google_embedded_map(building)
    iframe = <<-IFRAME
     <iframe width="390" height="320" frameborder="0" style="border:0"
      src="https://www.google.com/maps/embed/v1/place?key=#{ENV['GOOGLE_MAP_API_KEY']}&q=#{building.address}"
      allowfullscreen>
     </iframe>
    IFRAME
    iframe.html_safe
  end

  def embedded_map_tag(building)
    if building.has_address?
      google_embedded_map(building)
    else
      "This building needs an address".html_safe
    end
  end

  def static_map_tag(building)
    if building.needs_geocoding?
      "Sorry, no map available for this building yet."
    else
      google_static_map(building)
    end
  end

  def api_key
    ENV['GOOGLE_MAP_API_KEY']
  end

  def google_street_view_url(building)
      "https://maps.googleapis.com/maps/api/streetview?size=390x330&location=#{building.address}&key=#{api_key}".html_safe
  end

  def google_street_view_tag(building)
    if building.gsv
      %{<img src="#{building.gsv}" />}.html_safe
    else
      image_tag google_street_view_url(building)
    end
  end

  def building_versions_link(building)
    versions = building.versions
    if versions.count > 0
      link_to 'Show versions', building_versions_path(building)
    end
  end

  def showing_older_version?(version_id = @version_id)
    !!version_id
  end
end
