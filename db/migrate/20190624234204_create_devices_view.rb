class CreateDevicesView < ActiveRecord::Migration[5.2]
  def up
    tables = %w{batteries battery_histories
    levels level_histories leveL_raws
    quips
    sleep_plans sleep_plan_histories
    sparks spark_diagnostics}
    unions = tables.
               map do |tbl|
      <<-SQL
SELECT DISTINCT
       coreid,
       MIN(created_at) AS created_at,
       MIN(updated_at) AS updated_at
 FROM #{ tbl }
GROUP BY coreid
SQL
    end.
               join(" UNION ")
    Device.connection.execute(<<-SQL)
CREATE OR REPLACE VIEW devices
AS
(
        SELECT
        coreid,
        MIN(created_at) AS created_at,
        MIN(updated_at) AS updated_at
FROM (
#{unions}
        ) AS cores
        GROUP BY coreid
        ORDER BY coreid ASC
)
SQL
  end

  def down
    Device.connection.execute("DROP VIEW IF EXISTS devices")
  end
end
