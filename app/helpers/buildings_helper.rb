module BuildingsHelper
  def gsv_or_link(gsv)
    return "" if gsv.nil?
    return "" if gsv.empty?
    return gsv unless /^http/ =~ gsv
    "<a href=#{gsv}>#{gsv}</a>".html_safe
  end
end
