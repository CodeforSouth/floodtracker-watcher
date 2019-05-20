namespace :rollup do
  desc "Do daily aggregation and cleaning"
  task daily: :environment do
    [SparkDiagnostic, Level, LevelRaw, SleepPlan, Battery].each do |m|
      m.rollup
    end
    Battery.connection.execute(<<-SQL)
VACUUM FULL ANALYZE;
SQL
  end

end
