json.extract! level_history, :id, :date, :coreid, :count, :first_publish, :last_id, :min_reading, :mean_reading, :stddev_reading, :max_reading, :first_reading, :created_at, :updated_at
json.url level_history_url(level_history, format: :json)
