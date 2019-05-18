class CopyQuips < ActiveRecord::Migration[5.2]
  def up
    Quip.connection.execute(<<-SQL)
    INSERT INTO quips
    (body, coreid, published_at, created_at, updated_at)
    (SELECT
      data, coreid, published_at, now(), now()
      FROM
      sparks
      WHERE
        event = 'floodtracker/quip'
    );
SQL
  end
end
