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

  def static_map_tag(building)
    if building.needs_geocoding?
      "Sorry, no map available for this building yet."
    else
      google_static_map(center: [building.latitude, building.longitude].join(','))
    end
  end
end
