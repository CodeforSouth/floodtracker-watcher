class Spark < ApplicationRecord
  def self.ingest(params)
    create params
  end
end
