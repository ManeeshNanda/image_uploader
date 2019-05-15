require 'test_helper'

class MainpageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mainpage_index_url
    assert_response :success
  end

end
