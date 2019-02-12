require 'test_helper'

class SparksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spark = sparks(:one)
  end

  test "should get index" do
    get sparks_url
    assert_response :success
  end

  test "should get new" do
    get new_spark_url
    assert_response :success
  end

  test "should create spark" do
    assert_difference('Spark.count') do
      post sparks_url, params: { spark: { coreid: @spark.coreid, data: @spark.data, event: @spark.event, published_at: @spark.published_at } }
    end

    assert_redirected_to spark_url(Spark.last)
  end

  test "should show spark" do
    get spark_url(@spark)
    assert_response :success
  end

  test "should get edit" do
    get edit_spark_url(@spark)
    assert_response :success
  end

  test "should update spark" do
    patch spark_url(@spark), params: { spark: { coreid: @spark.coreid, data: @spark.data, event: @spark.event, published_at: @spark.published_at } }
    assert_redirected_to spark_url(@spark)
  end

  test "should destroy spark" do
    assert_difference('Spark.count', -1) do
      delete spark_url(@spark)
    end

    assert_redirected_to sparks_url
  end
end
