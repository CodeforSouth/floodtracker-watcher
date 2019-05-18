class Ingester
  EVENT_MAPPING = {
    "floodtracker/sleep_plan" => SleepPlan,
    "floodtracker/battery" => Battery,
    "floodtracker/level_mm" => Level,
    "floodtracker/levels_cm" => LevelRaw,
    "spark/device/diagnostics/update" => SparkDiagnostic,
    "floodtracker/quip" => Quip
  }

  def self.ingest(params)
    event_klass = params[:event]

    if event_klass.nil?
      event_klass = Spark
    end
    
    event_klass.ingest(params)
  end
end
