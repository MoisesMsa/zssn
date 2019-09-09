require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_infected_total" do
    get reports_get_infected_total_url
    assert_response :success
  end

  test "should get get_non_infected" do
    get reports_get_non_infected_url
    assert_response :success
  end

  test "should get avg_items" do
    get reports_avg_items_url
    assert_response :success
  end

  test "should get infected_lost_points" do
    get reports_infected_lost_points_url
    assert_response :success
  end

end
