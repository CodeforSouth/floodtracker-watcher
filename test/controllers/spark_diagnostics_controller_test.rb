require 'test_helper'

class SparkDiagnosticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spark_diagnostic = spark_diagnostics(:one)
  end

  test "should get index" do
    get spark_diagnostics_url
    assert_response :success
  end

  test "should get new" do
    get new_spark_diagnostic_url
    assert_response :success
  end

  test "should create spark_diagnostic" do
    assert_difference('SparkDiagnostic.count') do
      post spark_diagnostics_url, params: { spark_diagnostic: { diagnostic: @spark_diagnostic.diagnostic } }
    end

    assert_redirected_to spark_diagnostic_url(SparkDiagnostic.last)
  end

  test "should show spark_diagnostic" do
    get spark_diagnostic_url(@spark_diagnostic)
    assert_response :success
  end

  test "should get edit" do
    get edit_spark_diagnostic_url(@spark_diagnostic)
    assert_response :success
  end

  test "should update spark_diagnostic" do
    patch spark_diagnostic_url(@spark_diagnostic), params: { spark_diagnostic: { diagnostic: @spark_diagnostic.diagnostic } }
    assert_redirected_to spark_diagnostic_url(@spark_diagnostic)
  end

  test "should destroy spark_diagnostic" do
    assert_difference('SparkDiagnostic.count', -1) do
      delete spark_diagnostic_url(@spark_diagnostic)
    end

    assert_redirected_to spark_diagnostics_url
  end
end
