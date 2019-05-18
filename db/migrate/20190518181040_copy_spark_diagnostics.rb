class CopySparkDiagnostics < ActiveRecord::Migration[5.2]
  def up
    SparkDiagnostic.connection.execute(<<-SQL)
    INSERT INTO spark_diagnostics
    (diagnostic, coreid, published_at, created_at, updated_at)
    (SELECT
      CAST(data AS json),
      coreid,
      published_at,
      NOW(),
      NOW()
    FROM
      sparks
    WHERE
      event = 'spark/device/diagnostics/update'
    );
SQL
  end
end
