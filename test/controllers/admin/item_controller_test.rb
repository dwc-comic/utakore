require 'test_helper'

class Admin::ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_item_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_item_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_item_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_item_edit_url
    assert_response :success
  end

end
