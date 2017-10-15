require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "should get multisearch" do
    # get search_multisearch_url
    # assert_response :success
  end

end
