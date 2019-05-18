class SparkDiagnostic < ApplicationRecord
  def self.ingest(params)
    create(
      diagnostic: params[:data],
      coreid: params[:coreid],
      published_at: params[:published_at]
    )
  end

  def self.rollup
    where("published_at < (now() - '7 day'::interval)").
      delete_all
  end
end
