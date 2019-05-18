require "application_system_test_case"

class SleepPlansTest < ApplicationSystemTestCase
  setup do
    @sleep_plan = sleep_plans(:one)
  end

  test "visiting the index" do
    visit sleep_plans_url
    assert_selector "h1", text: "Sleep Plans"
  end

  test "creating a Sleep plan" do
    visit sleep_plans_url
    click_on "New Sleep Plan"

    fill_in "Plan", with: @sleep_plan.plan
    click_on "Create Sleep plan"

    assert_text "Sleep plan was successfully created"
    click_on "Back"
  end

  test "updating a Sleep plan" do
    visit sleep_plans_url
    click_on "Edit", match: :first

    fill_in "Plan", with: @sleep_plan.plan
    click_on "Update Sleep plan"

    assert_text "Sleep plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Sleep plan" do
    visit sleep_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sleep plan was successfully destroyed"
  end
end
