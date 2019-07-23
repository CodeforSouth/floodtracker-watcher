class Device < ApplicationRecord
  self.primary_key = 'id'

  RELATED_TABLES = %w{batteries battery_histories
    levels level_histories leveL_raws
    quips
    sleep_plans sleep_plan_histories
    sparks spark_diagnostics}

  RELATED_TABLES.each do |t|
    has_many t.to_sym, foreign_key: 'coreid'
  end
end
