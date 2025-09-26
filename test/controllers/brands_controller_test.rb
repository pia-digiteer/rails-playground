require "test_helper"

class BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch" do
    get brands_fetch_url
    assert_response :success
  end
end
