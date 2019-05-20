require 'test_helper'

class BatteryHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @battery_history = battery_histories(:one)
  end

  test "should get index" do
    get battery_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_battery_history_url
    assert_response :success
  end

  test "should create battery_history" do
    assert_difference('BatteryHistory.count') do
      post battery_histories_url, params: { battery_history: { coreid: @battery_history.coreid, count: @battery_history.count, date: @battery_history.date, first_publish: @battery_history.first_publish, first_reading: @battery_history.first_reading, last_id: @battery_history.last_id, max_reading: @battery_history.max_reading, mean_reading: @battery_history.mean_reading, min_reading: @battery_history.min_reading, stddev_reading: @battery_history.stddev_reading } }
    end

    assert_redirected_to battery_history_url(BatteryHistory.last)
  end

  test "should show battery_history" do
    get battery_history_url(@battery_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_battery_history_url(@battery_history)
    assert_response :success
  end

  test "should update battery_history" do
    patch battery_history_url(@battery_history), params: { battery_history: { coreid: @battery_history.coreid, count: @battery_history.count, date: @battery_history.date, first_publish: @battery_history.first_publish, first_reading: @battery_history.first_reading, last_id: @battery_history.last_id, max_reading: @battery_history.max_reading, mean_reading: @battery_history.mean_reading, min_reading: @battery_history.min_reading, stddev_reading: @battery_history.stddev_reading } }
    assert_redirected_to battery_history_url(@battery_history)
  end

  test "should destroy battery_history" do
    assert_difference('BatteryHistory.count', -1) do
      delete battery_history_url(@battery_history)
    end

    assert_redirected_to battery_histories_url
  end
end
