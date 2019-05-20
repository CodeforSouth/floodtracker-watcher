class Level < ApplicationRecord
  def self.ingest(params)
    create(
      reading: params[:data],
      coreid: params[:coreid],
      published_at: params[:published_at]
    )
  end

  def self.rollup
    connection.execute(<<-SQL)
INSERT INTO level_histories
(date, coreid, "count", first_publish, last_id, min_reading, mean_reading,
stddev_reading, max_reading, first_reading, created_at, updated_at)
(SELECT i.*,
        t.reading AS first_reading,
        now(), now()
FROM (
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
                    (SELECT MIN(DATE(published_at)) FROM levels),
                    (SELECT MAX(DATE(published_at)) FROM levels
                        WHERE published_at < NOW() - '8 d'::interval
                    ),
                    '1 day')) AS date) AS windows

    INNER JOIN
        levels AS s ON date(s.published_at) = windows.date
    GROUP BY
        windows.date, s.coreid
    ORDER BY
        windows.date asc, s.coreid asc) AS i
INNER JOIN
        levels AS t ON
                t.coreid = i.coreid AND
                t.published_at = i.first_publish
);
SQL

    connection.execute(<<-SQL)
DELETE FROM levels
    USING
        (SELECT
                MAX(last_id) AS final_reading_id,
                coreid FROM level_histories
            GROUP BY coreid) AS groupings
        WHERE
            levels.id <= groupings.final_reading_id AND
            levels.coreid = groupings.coreid;
SQL
  end
end
