class SleepPlan < ApplicationRecord
  def self.ingest(params)
    create(
      plan: params[:data],
      coreid: params[:coreid],
      published_at: params[:published_at]
    )
  end
end
