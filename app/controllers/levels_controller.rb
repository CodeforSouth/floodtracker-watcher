class LevelsController < ApplicationController
  def index
    @cols = %w{date coreid count min avg stddev max}

    @sparks = Spark.connection.select_all(<<-SQL)
SELECT
        windows.date,
        s.coreid,
        count(s.data),
        MIN(cast(s.data AS FLOAT)),

        AVG(cast(s.data AS FLOAT)),

        STDDEV(cast(s.data AS FLOAT)),
        MAX(cast(s.data AS FLOAT))
FROM
        (SELECT DATE(generate_series(
                (SELECT MIN(DATE(published_at)) FROM sparks),
                (SELECT MAX(DATE(published_at)) FROM sparks),
                '1 day')) AS date) as windows

RIGHT JOIN
      sparks as s
      ON date(s.published_at) = windows.date
WHERE
        s.event = 'floodtracker/level_mm'
GROUP BY
      windows.date,
      s.coreid
order by
      windows.date asc,
      s.coreid asc;
SQL
  end
end
