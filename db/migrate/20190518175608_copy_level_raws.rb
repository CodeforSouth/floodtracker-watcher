class CopyLevelRaws < ActiveRecord::Migration[5.2]
  def up
    LevelRaw.connection.execute(<<-SQL)
    INSERT INTO level_raws
    (readings, coreid, published_at, created_at, updated_at)
    (SELECT
      cast(string_to_array(data, ' ') as double precision[]),
      coreid,
      published_at,
      now(),
      now()
    FROM
      sparks
    WHERE
      event = 'floodtracker/levels_cm'
    );
SQL
  end
end
