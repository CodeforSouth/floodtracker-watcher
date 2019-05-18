require "application_system_test_case"

class LevelRawsTest < ApplicationSystemTestCase
  setup do
    @level_raw = level_raws(:one)
  end

  test "visiting the index" do
    visit level_raws_url
    assert_selector "h1", text: "Level Raws"
  end

  test "creating a Level raw" do
    visit level_raws_url
    click_on "New Level Raw"

    fill_in "Readings", with: @level_raw.readings
    click_on "Create Level raw"

    assert_text "Level raw was successfully created"
    click_on "Back"
  end

  test "updating a Level raw" do
    visit level_raws_url
    click_on "Edit", match: :first

    fill_in "Readings", with: @level_raw.readings
    click_on "Update Level raw"

    assert_text "Level raw was successfully updated"
    click_on "Back"
  end

  test "destroying a Level raw" do
    visit level_raws_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Level raw was successfully destroyed"
  end
end
