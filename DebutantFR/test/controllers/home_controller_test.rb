require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get beranda" do
    get home_beranda_url
    assert_response :success
  end
end
