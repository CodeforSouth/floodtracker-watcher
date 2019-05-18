class HoseOutSparks < ActiveRecord::Migration[5.2]
  def up
    Spark.delete_all
  end
end
