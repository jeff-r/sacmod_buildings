module BuildingsHelper
  def gsv_or_link(gsv)
    return "" if gsv.nil?
    return "" if gsv.empty?
    return gsv unless /^http/ =~ gsv
    "<a href=#{gsv}>#{gsv}</a>".html_safe
  end

  def google_static_map(center)
    image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17&markers=#{center}"
  end

  def google_embedded_map_via_coords(building)
    iframe = <<-IFRAME
     <iframe width="390" height="330" frameborder="0" style="border:0"
      src="https://www.google.com/maps/embed/v1/place?key=#{ENV['GOOGLE_MAP_API_KEY']}&q=#{building.map_center}"
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
end
