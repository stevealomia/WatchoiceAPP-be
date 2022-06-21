require "test_helper"

class Api::WatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_watches_index_url
    assert_response :success
  end
end
