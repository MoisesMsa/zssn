require 'test_helper'

class SuvivorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get suvivors_show_url
    assert_response :success
  end

  test "should get index" do
    get suvivors_index_url
    assert_response :success
  end

  test "should get destroy" do
    get suvivors_destroy_url
    assert_response :success
  end

  test "should get update" do
    get suvivors_update_url
    assert_response :success
  end

  test "should get create" do
    get suvivors_create_url
    assert_response :success
  end

end
