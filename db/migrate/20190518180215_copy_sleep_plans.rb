class CopySleepPlans < ActiveRecord::Migration[5.2]
  def up
    SleepPlan.connection.execute(<<-SQL)
    INSERT INTO sleep_plans
    (plan, coreid, published_at, created_at, updated_at)
    (SELECT
      CAST(data AS integer),
      coreid,
      published_at,
      now(),
      now()
    FROM
      sparks
    WHERE
      event = 'floodtracker/sleep_plan'
    );
SQL
  end
end
