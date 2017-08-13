require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get multisearch" do
    get search_multisearch_url
    assert_response :success
  end

end
