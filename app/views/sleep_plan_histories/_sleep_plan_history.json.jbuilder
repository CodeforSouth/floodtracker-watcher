json.extract! sleep_plan_history, :id, :date, :coreid, :sleep_count, :first_publish, :last_id, :min_plan, :mean_reading, :total_plan, :max_plan, :created_at, :updated_at
json.url sleep_plan_history_url(sleep_plan_history, format: :json)
