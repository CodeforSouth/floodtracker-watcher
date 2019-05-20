require 'test_helper'

class SleepPlanHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sleep_plan_history = sleep_plan_histories(:one)
  end

  test "should get index" do
    get sleep_plan_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_sleep_plan_history_url
    assert_response :success
  end

  test "should create sleep_plan_history" do
    assert_difference('SleepPlanHistory.count') do
      post sleep_plan_histories_url, params: { sleep_plan_history: { coreid: @sleep_plan_history.coreid, date: @sleep_plan_history.date, first_publish: @sleep_plan_history.first_publish, last_id: @sleep_plan_history.last_id, max_plan: @sleep_plan_history.max_plan, mean_reading: @sleep_plan_history.mean_reading, min_plan: @sleep_plan_history.min_plan, sleep_count: @sleep_plan_history.sleep_count, total_plan: @sleep_plan_history.total_plan } }
    end

    assert_redirected_to sleep_plan_history_url(SleepPlanHistory.last)
  end

  test "should show sleep_plan_history" do
    get sleep_plan_history_url(@sleep_plan_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_sleep_plan_history_url(@sleep_plan_history)
    assert_response :success
  end

  test "should update sleep_plan_history" do
    patch sleep_plan_history_url(@sleep_plan_history), params: { sleep_plan_history: { coreid: @sleep_plan_history.coreid, date: @sleep_plan_history.date, first_publish: @sleep_plan_history.first_publish, last_id: @sleep_plan_history.last_id, max_plan: @sleep_plan_history.max_plan, mean_reading: @sleep_plan_history.mean_reading, min_plan: @sleep_plan_history.min_plan, sleep_count: @sleep_plan_history.sleep_count, total_plan: @sleep_plan_history.total_plan } }
    assert_redirected_to sleep_plan_history_url(@sleep_plan_history)
  end

  test "should destroy sleep_plan_history" do
    assert_difference('SleepPlanHistory.count', -1) do
      delete sleep_plan_history_url(@sleep_plan_history)
    end

    assert_redirected_to sleep_plan_histories_url
  end
end
