require 'test_helper'

class LevelHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @level_history = level_histories(:one)
  end

  test "should get index" do
    get level_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_level_history_url
    assert_response :success
  end

  test "should create level_history" do
    assert_difference('LevelHistory.count') do
      post level_histories_url, params: { level_history: { coreid: @level_history.coreid, count: @level_history.count, date: @level_history.date, first_publish: @level_history.first_publish, first_reading: @level_history.first_reading, last_id: @level_history.last_id, max_reading: @level_history.max_reading, mean_reading: @level_history.mean_reading, min_reading: @level_history.min_reading, stddev_reading: @level_history.stddev_reading } }
    end

    assert_redirected_to level_history_url(LevelHistory.last)
  end

  test "should show level_history" do
    get level_history_url(@level_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_level_history_url(@level_history)
    assert_response :success
  end

  test "should update level_history" do
    patch level_history_url(@level_history), params: { level_history: { coreid: @level_history.coreid, count: @level_history.count, date: @level_history.date, first_publish: @level_history.first_publish, first_reading: @level_history.first_reading, last_id: @level_history.last_id, max_reading: @level_history.max_reading, mean_reading: @level_history.mean_reading, min_reading: @level_history.min_reading, stddev_reading: @level_history.stddev_reading } }
    assert_redirected_to level_history_url(@level_history)
  end

  test "should destroy level_history" do
    assert_difference('LevelHistory.count', -1) do
      delete level_history_url(@level_history)
    end

    assert_redirected_to level_histories_url
  end
end
