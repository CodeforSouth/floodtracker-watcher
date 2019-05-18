require 'test_helper'

class LevelRawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @level_raw = level_raws(:one)
  end

  test "should get index" do
    get level_raws_url
    assert_response :success
  end

  test "should get new" do
    get new_level_raw_url
    assert_response :success
  end

  test "should create level_raw" do
    assert_difference('LevelRaw.count') do
      post level_raws_url, params: { level_raw: { readings: @level_raw.readings } }
    end

    assert_redirected_to level_raw_url(LevelRaw.last)
  end

  test "should show level_raw" do
    get level_raw_url(@level_raw)
    assert_response :success
  end

  test "should get edit" do
    get edit_level_raw_url(@level_raw)
    assert_response :success
  end

  test "should update level_raw" do
    patch level_raw_url(@level_raw), params: { level_raw: { readings: @level_raw.readings } }
    assert_redirected_to level_raw_url(@level_raw)
  end

  test "should destroy level_raw" do
    assert_difference('LevelRaw.count', -1) do
      delete level_raw_url(@level_raw)
    end

    assert_redirected_to level_raws_url
  end
end
