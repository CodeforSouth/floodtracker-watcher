require "application_system_test_case"

class BatteryHistoriesTest < ApplicationSystemTestCase
  setup do
    @battery_history = battery_histories(:one)
  end

  test "visiting the index" do
    visit battery_histories_url
    assert_selector "h1", text: "Battery Histories"
  end

  test "creating a Battery history" do
    visit battery_histories_url
    click_on "New Battery History"

    fill_in "Coreid", with: @battery_history.coreid
    fill_in "Count", with: @battery_history.count
    fill_in "Date", with: @battery_history.date
    fill_in "First publish", with: @battery_history.first_publish
    fill_in "First reading", with: @battery_history.first_reading
    fill_in "Last", with: @battery_history.last_id
    fill_in "Max reading", with: @battery_history.max_reading
    fill_in "Mean reading", with: @battery_history.mean_reading
    fill_in "Min reading", with: @battery_history.min_reading
    fill_in "Stddev reading", with: @battery_history.stddev_reading
    click_on "Create Battery history"

    assert_text "Battery history was successfully created"
    click_on "Back"
  end

  test "updating a Battery history" do
    visit battery_histories_url
    click_on "Edit", match: :first

    fill_in "Coreid", with: @battery_history.coreid
    fill_in "Count", with: @battery_history.count
    fill_in "Date", with: @battery_history.date
    fill_in "First publish", with: @battery_history.first_publish
    fill_in "First reading", with: @battery_history.first_reading
    fill_in "Last", with: @battery_history.last_id
    fill_in "Max reading", with: @battery_history.max_reading
    fill_in "Mean reading", with: @battery_history.mean_reading
    fill_in "Min reading", with: @battery_history.min_reading
    fill_in "Stddev reading", with: @battery_history.stddev_reading
    click_on "Update Battery history"

    assert_text "Battery history was successfully updated"
    click_on "Back"
  end

  test "destroying a Battery history" do
    visit battery_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Battery history was successfully destroyed"
  end
end
