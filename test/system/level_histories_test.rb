require "application_system_test_case"

class LevelHistoriesTest < ApplicationSystemTestCase
  setup do
    @level_history = level_histories(:one)
  end

  test "visiting the index" do
    visit level_histories_url
    assert_selector "h1", text: "Level Histories"
  end

  test "creating a Level history" do
    visit level_histories_url
    click_on "New Level History"

    fill_in "Coreid", with: @level_history.coreid
    fill_in "Count", with: @level_history.count
    fill_in "Date", with: @level_history.date
    fill_in "First publish", with: @level_history.first_publish
    fill_in "First reading", with: @level_history.first_reading
    fill_in "Last", with: @level_history.last_id
    fill_in "Max reading", with: @level_history.max_reading
    fill_in "Mean reading", with: @level_history.mean_reading
    fill_in "Min reading", with: @level_history.min_reading
    fill_in "Stddev reading", with: @level_history.stddev_reading
    click_on "Create Level history"

    assert_text "Level history was successfully created"
    click_on "Back"
  end

  test "updating a Level history" do
    visit level_histories_url
    click_on "Edit", match: :first

    fill_in "Coreid", with: @level_history.coreid
    fill_in "Count", with: @level_history.count
    fill_in "Date", with: @level_history.date
    fill_in "First publish", with: @level_history.first_publish
    fill_in "First reading", with: @level_history.first_reading
    fill_in "Last", with: @level_history.last_id
    fill_in "Max reading", with: @level_history.max_reading
    fill_in "Mean reading", with: @level_history.mean_reading
    fill_in "Min reading", with: @level_history.min_reading
    fill_in "Stddev reading", with: @level_history.stddev_reading
    click_on "Update Level history"

    assert_text "Level history was successfully updated"
    click_on "Back"
  end

  test "destroying a Level history" do
    visit level_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Level history was successfully destroyed"
  end
end
