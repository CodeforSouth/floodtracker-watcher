class SleepPlan < ApplicationRecord
  def self.ingest(params)
    create(
      plan: params[:data],
      coreid: params[:coreid],
      published_at: params[:published_at]
    )
  end

  def self.rollup

    connection.execute(<<-SQL)
INSERT INTO sleep_plan_histories
       (date, coreid, sleep_count, first_publish, last_id, min_plan, max_plan,
created_at, updated_at)
(SELECT
            windows.date,
            s.coreid,
            COUNT(s.plan),
            MIN(s.published_at) AS first_publish,
            MAX(s.id) AS last_id,
            min(s.plan) as min_plan,
            sum(s.plan) as total_plan,
            MAX(s.plan) as max_plan,
            now(),
            now()
    FROM
            (SELECT DATE(generate_series(
                    (SELECT MIN(DATE(published_at)) FROM levels),
                    (SELECT MAX(DATE(published_at)) FROM levels
                        WHERE published_at < (NOW() - '8 d'::interval)
                    ),
                    '1 day')) AS date) AS windows

    INNER JOIN
        sleep_plans AS s ON date(s.published_at) = windows.date
    GROUP BY
        windows.date, s.coreid
    ORDER BY
        windows.date asc, s.coreid asc);
SQL

    connection.execute(<<-SQL)
DELETE FROM sleep_plans
    USING
        (SELECT
                MAX(last_id) AS final_reading_id,
                coreid FROM level_histories
            GROUP BY coreid) AS groupings
        WHERE
            sleep_plans.id <= groupings.final_reading_id AND
            sleep_plans.coreid = groupings.coreid;
SQL
  end
end
