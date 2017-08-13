class SearchController < ApplicationController
  def multisearch
    search_text = params[:search_text]
    search_results = PgSearch.multisearch(search_text).to_a
    architects = search_results.select {|result| result.searchable_type == "Architect" }.sort { |result1, result2| result1.content <=> result2.content }
    buildings  = search_results.select {|result| result.searchable_type == "Building" }.sort { |result1, result2| result1.content <=> result2.content }

    @search_results = architects + buildings
  end
end
