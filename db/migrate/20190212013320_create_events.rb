class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event
      t.integer :data
      t.string :coreid
      t.datetime :published_at

      t.timestamps
    end
  end
end
