class CopyBatteries < ActiveRecord::Migration[5.2]
  def up
    Battery.connection.execute(<<-SQL)
    INSERT INTO batteries
    (reading, coreid, published_at, created_at, updated_at)
    (SELECT
        CAST(data AS float),
        coreid,
        published_at,
        now(),
        now()
      FROM
        sparks
      WHERE
        event = 'floodtracker/battery'
    );
SQL
  end
end
