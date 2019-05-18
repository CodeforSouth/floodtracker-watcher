class CopyLevels < ActiveRecord::Migration[5.2]
  def up
    Level.connection.execute(<<-SQL)
      INSERT INTO levels
        (reading, coreid, published_at, created_at, updated_at)
        (SELECT
                CAST(data AS integer) as reading,
                coreid,
                published_at,
                now() as created_at,
                now() as updated_at
             FROM
                sparks
             WHERE
                event = 'floodtracker/level_mm'
)
      ;
SQL
  end
end
