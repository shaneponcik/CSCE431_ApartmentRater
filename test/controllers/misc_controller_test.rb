require 'test_helper'

class MiscControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get misc_index_url
    assert_response :success
  end

end
