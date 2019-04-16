require 'test_helper'

class User::PurchacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_purchaces_index_url
    assert_response :success
  end

  test "should get pay" do
    get user_purchaces_pay_url
    assert_response :success
  end

end
