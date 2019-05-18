require "application_system_test_case"

class LevelsTest < ApplicationSystemTestCase
  setup do
    @level = levels(:one)
  end

  test "visiting the index" do
    visit levels_url
    assert_selector "h1", text: "Levels"
  end

  test "creating a Level" do
    visit levels_url
    click_on "New Level"

    fill_in "Reading", with: @level.reading
    click_on "Create Level"

    assert_text "Level was successfully created"
    click_on "Back"
  end

  test "updating a Level" do
    visit levels_url
    click_on "Edit", match: :first

    fill_in "Reading", with: @level.reading
    click_on "Update Level"

    assert_text "Level was successfully updated"
    click_on "Back"
  end

  test "destroying a Level" do
    visit levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Level was successfully destroyed"
  end
end
