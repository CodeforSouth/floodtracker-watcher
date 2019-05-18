class SparkDiagnostic < ApplicationRecord
  def self.ingest(params)
    create(
      diagnostic: params[:data],
      coreid: params[:coreid],
      published_at: params[:published_at]
    )
  end
end
