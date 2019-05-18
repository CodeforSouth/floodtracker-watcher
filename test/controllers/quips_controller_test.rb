require 'test_helper'

class QuipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quip = quips(:one)
  end

  test "should get index" do
    get quips_url
    assert_response :success
  end

  test "should get new" do
    get new_quip_url
    assert_response :success
  end

  test "should create quip" do
    assert_difference('Quip.count') do
      post quips_url, params: { quip: { body: @quip.body } }
    end

    assert_redirected_to quip_url(Quip.last)
  end

  test "should show quip" do
    get quip_url(@quip)
    assert_response :success
  end

  test "should get edit" do
    get edit_quip_url(@quip)
    assert_response :success
  end

  test "should update quip" do
    patch quip_url(@quip), params: { quip: { body: @quip.body } }
    assert_redirected_to quip_url(@quip)
  end

  test "should destroy quip" do
    assert_difference('Quip.count', -1) do
      delete quip_url(@quip)
    end

    assert_redirected_to quips_url
  end
end
