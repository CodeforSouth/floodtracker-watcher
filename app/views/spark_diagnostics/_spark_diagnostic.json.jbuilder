json.extract! spark_diagnostic, :id, :diagnostic, :created_at, :updated_at
json.url spark_diagnostic_url(spark_diagnostic, format: :json)
