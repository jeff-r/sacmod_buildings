module ImageHelper
  def first_thumbnail_tag(building)
    return "" if building.images.empty?

    "<img src='#{building.images.first.thumb_path}' />".html_safe
  end
end
