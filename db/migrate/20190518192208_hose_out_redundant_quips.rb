class HoseOutRedundantQuips < ActiveRecord::Migration[5.2]
  def up
    Quip.connection.execute(<<-SQL)
DELETE FROM quips
WHERE id IN
  (SELECT id FROM
    (SELECT
        id, coreid, published_at, body,
        LAG(body) OVER
            (ORDER BY coreid DESC, published_at ASC) AS prev
        FROM quips) AS hist
WHERE body IS not DISTINCT FROM prev
ORDER BY published_at DESC, coreid DESC
);
SQL
  end
end
