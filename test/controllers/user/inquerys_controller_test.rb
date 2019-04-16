require 'test_helper'

class User::InquerysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_inquerys_index_url
    assert_response :success
  end

end
