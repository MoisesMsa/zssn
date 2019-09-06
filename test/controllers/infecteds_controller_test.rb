require 'test_helper'

class InfectedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infecteds_index_url
    assert_response :success
  end

  test "should get show" do
    get infecteds_show_url
    assert_response :success
  end

  test "should get create" do
    get infecteds_create_url
    assert_response :success
  end

end
