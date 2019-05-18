require "application_system_test_case"

class SparkDiagnosticsTest < ApplicationSystemTestCase
  setup do
    @spark_diagnostic = spark_diagnostics(:one)
  end

  test "visiting the index" do
    visit spark_diagnostics_url
    assert_selector "h1", text: "Spark Diagnostics"
  end

  test "creating a Spark diagnostic" do
    visit spark_diagnostics_url
    click_on "New Spark Diagnostic"

    fill_in "Diagnostic", with: @spark_diagnostic.diagnostic
    click_on "Create Spark diagnostic"

    assert_text "Spark diagnostic was successfully created"
    click_on "Back"
  end

  test "updating a Spark diagnostic" do
    visit spark_diagnostics_url
    click_on "Edit", match: :first

    fill_in "Diagnostic", with: @spark_diagnostic.diagnostic
    click_on "Update Spark diagnostic"

    assert_text "Spark diagnostic was successfully updated"
    click_on "Back"
  end

  test "destroying a Spark diagnostic" do
    visit spark_diagnostics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spark diagnostic was successfully destroyed"
  end
end
