require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get inventories_show_url
    assert_response :success
  end

  test "should get index" do
    get inventories_index_url
    assert_response :success
  end

  test "should get trade" do
    get inventories_trade_url
    assert_response :success
  end

end
