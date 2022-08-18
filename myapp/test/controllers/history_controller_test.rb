require "test_helper"

class HistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get history_add_url
    assert_response :success
  end
end
