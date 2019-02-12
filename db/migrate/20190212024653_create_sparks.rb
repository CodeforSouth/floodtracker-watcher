class CreateSparks < ActiveRecord::Migration[5.2]
  def change
    create_table :sparks do |t|
      t.string :event
      t.string :data
      t.string :coreid
      t.datetime :published_at

      t.timestamps
    end
  end
end
