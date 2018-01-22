require 'test_helper'

class ZipdownloadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get zipdownload_index_url
    assert_response :success
  end

end
