require "application_system_test_case"

class QuipsTest < ApplicationSystemTestCase
  setup do
    @quip = quips(:one)
  end

  test "visiting the index" do
    visit quips_url
    assert_selector "h1", text: "Quips"
  end

  test "creating a Quip" do
    visit quips_url
    click_on "New Quip"

    fill_in "Body", with: @quip.body
    click_on "Create Quip"

    assert_text "Quip was successfully created"
    click_on "Back"
  end

  test "updating a Quip" do
    visit quips_url
    click_on "Edit", match: :first

    fill_in "Body", with: @quip.body
    click_on "Update Quip"

    assert_text "Quip was successfully updated"
    click_on "Back"
  end

  test "destroying a Quip" do
    visit quips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quip was successfully destroyed"
  end
end
