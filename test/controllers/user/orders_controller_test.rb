require 'test_helper'

class User::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get user_orders_show_url
    assert_response :success
  end

end
