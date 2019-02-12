require "application_system_test_case"

class SparksTest < ApplicationSystemTestCase
  setup do
    @spark = sparks(:one)
  end

  test "visiting the index" do
    visit sparks_url
    assert_selector "h1", text: "Sparks"
  end

  test "creating a Spark" do
    visit sparks_url
    click_on "New Spark"

    fill_in "Coreid", with: @spark.coreid
    fill_in "Data", with: @spark.data
    fill_in "Event", with: @spark.event
    fill_in "Published at", with: @spark.published_at
    click_on "Create Spark"

    assert_text "Spark was successfully created"
    click_on "Back"
  end

  test "updating a Spark" do
    visit sparks_url
    click_on "Edit", match: :first

    fill_in "Coreid", with: @spark.coreid
    fill_in "Data", with: @spark.data
    fill_in "Event", with: @spark.event
    fill_in "Published at", with: @spark.published_at
    click_on "Update Spark"

    assert_text "Spark was successfully updated"
    click_on "Back"
  end

  test "destroying a Spark" do
    visit sparks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spark was successfully destroyed"
  end
end
