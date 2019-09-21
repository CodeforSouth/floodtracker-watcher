class CreateSyntheticBatteryHistoriesView < ActiveRecord::Migration[5.2]
  def change
    conn = Battery.connection.execute(<<-SQL)
CREATE VIEW synthetic_battery_histories
(date, coreid, "count", first_publish, last_id, min_reading, mean_reading,
stddev_reading, max_reading, first_reading, created_at, updated_at)
AS
(
  SELECT
    date, coreid, "count", first_publish, last_id, min_reading, mean_reading,
    stddev_reading, max_reading, first_reading, created_at, updated_at
  FROM battery_histories
  UNION SELECT i.*,

        t.reading AS first_reading,
        now(), now() FROM(
    SELECT
    windows.date,
    s.coreid,
    COUNT(s.reading),
    MIN(s.published_at) AS first_publish,
            MAX(s.id) AS last_id,
            MIN(s.reading) as min_reading,
            AVG(s.reading) as mean_reading,
            STDDEV(s.reading) as stddev_reading,
            MAX(s.reading) as max_reading
    FROM
                (SELECT DATE(generate_series(
                    (SELECT MIN(DATE(published_at)) FROM batteries),
                    (SELECT MAX(DATE(published_at)) FROM batteries
                        WHERE date(published_at) < date(NOW() - '8 d'::interval)
                    ),
                    '1 day')) AS date) AS windows

    INNER JOIN
        batteries AS s ON date(s.published_at) = windows.date
    GROUP BY
        windows.date, s.coreid
    ORDER BY
        windows.date asc, s.coreid asc) AS i
INNER JOIN
        batteries AS t ON
                t.coreid = i.coreid AND
                t.published_at = i.first_publish
)
SQL
  end
end
