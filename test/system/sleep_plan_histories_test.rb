require "application_system_test_case"

class SleepPlanHistoriesTest < ApplicationSystemTestCase
  setup do
    @sleep_plan_history = sleep_plan_histories(:one)
  end

  test "visiting the index" do
    visit sleep_plan_histories_url
    assert_selector "h1", text: "Sleep Plan Histories"
  end

  test "creating a Sleep plan history" do
    visit sleep_plan_histories_url
    click_on "New Sleep Plan History"

    fill_in "Coreid", with: @sleep_plan_history.coreid
    fill_in "Date", with: @sleep_plan_history.date
    fill_in "First publish", with: @sleep_plan_history.first_publish
    fill_in "Last", with: @sleep_plan_history.last_id
    fill_in "Max plan", with: @sleep_plan_history.max_plan
    fill_in "Mean reading", with: @sleep_plan_history.mean_reading
    fill_in "Min plan", with: @sleep_plan_history.min_plan
    fill_in "Sleep count", with: @sleep_plan_history.sleep_count
    fill_in "Total plan", with: @sleep_plan_history.total_plan
    click_on "Create Sleep plan history"

    assert_text "Sleep plan history was successfully created"
    click_on "Back"
  end

  test "updating a Sleep plan history" do
    visit sleep_plan_histories_url
    click_on "Edit", match: :first

    fill_in "Coreid", with: @sleep_plan_history.coreid
    fill_in "Date", with: @sleep_plan_history.date
    fill_in "First publish", with: @sleep_plan_history.first_publish
    fill_in "Last", with: @sleep_plan_history.last_id
    fill_in "Max plan", with: @sleep_plan_history.max_plan
    fill_in "Mean reading", with: @sleep_plan_history.mean_reading
    fill_in "Min plan", with: @sleep_plan_history.min_plan
    fill_in "Sleep count", with: @sleep_plan_history.sleep_count
    fill_in "Total plan", with: @sleep_plan_history.total_plan
    click_on "Update Sleep plan history"

    assert_text "Sleep plan history was successfully updated"
    click_on "Back"
  end

  test "destroying a Sleep plan history" do
    visit sleep_plan_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sleep plan history was successfully destroyed"
  end
end
