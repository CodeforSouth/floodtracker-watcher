require 'test_helper'

class SleepPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sleep_plan = sleep_plans(:one)
  end

  test "should get index" do
    get sleep_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_sleep_plan_url
    assert_response :success
  end

  test "should create sleep_plan" do
    assert_difference('SleepPlan.count') do
      post sleep_plans_url, params: { sleep_plan: { plan: @sleep_plan.plan } }
    end

    assert_redirected_to sleep_plan_url(SleepPlan.last)
  end

  test "should show sleep_plan" do
    get sleep_plan_url(@sleep_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_sleep_plan_url(@sleep_plan)
    assert_response :success
  end

  test "should update sleep_plan" do
    patch sleep_plan_url(@sleep_plan), params: { sleep_plan: { plan: @sleep_plan.plan } }
    assert_redirected_to sleep_plan_url(@sleep_plan)
  end

  test "should destroy sleep_plan" do
    assert_difference('SleepPlan.count', -1) do
      delete sleep_plan_url(@sleep_plan)
    end

    assert_redirected_to sleep_plans_url
  end
end
