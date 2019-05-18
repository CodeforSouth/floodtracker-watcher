class LevelRaw < ApplicationRecord
  def self.ingest(params)
    create(
      readings: params[:data].split(" "),
      coreid: params[:coreid],
      published_at: params[:published_at]
    )
  end

  def self.rollup
    where("published_at < (now() - '7 day'::interval)").
      delete_all
  end
end
