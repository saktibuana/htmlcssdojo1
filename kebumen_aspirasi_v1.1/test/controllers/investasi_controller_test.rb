require "test_helper"

class InvestasiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get investasi_index_url
    assert_response :success
  end
end
