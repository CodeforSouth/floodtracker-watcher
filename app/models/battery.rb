class Battery < ApplicationRecord
  def self.ingest(params)
    create(
      reading: params[:data],
      coreid: params[:coreid],
      published_at: params[:published_at]
    )
  end
end
