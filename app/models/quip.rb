class Quip < ApplicationRecord
  def self.ingest(params)
    existing = self.
                 where(coreid: params[:coreid]).
                 order(published_at: :desc).
                 first

    return existing if existing && (existing.body == params[:data])

    self.create(
      body: params[:data],
      coreid: params[:coreid],
      published_at: params[:published_at]
    )
  end
end
