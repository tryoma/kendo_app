require 'test_helper'

class MainPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get main_pages_top_url
    assert_response :success
  end

end
