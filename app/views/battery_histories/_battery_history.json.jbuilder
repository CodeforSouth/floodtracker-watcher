json.extract! battery_history, :id, :date, :coreid, :count, :first_publish, :last_id, :min_reading, :mean_reading, :stddev_reading, :max_reading, :first_reading, :created_at, :updated_at
json.url battery_history_url(battery_history, format: :json)
