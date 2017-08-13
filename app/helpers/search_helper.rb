module SearchHelper
  def multisearch_link_tag search_result
    klass = Object.const_get search_result.searchable_type
    object = klass.find search_result.searchable_id
    link_to search_result.content, object
  end
end
