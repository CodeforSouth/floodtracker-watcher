class CreateLevelHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :level_histories do |t|
      t.date :date
      t.string :coreid
      t.integer :count
      t.column :first_publish, :timestamptz
      t.integer :last_id
      t.integer :min_reading
      t.float :mean_reading
      t.float :stddev_reading
      t.integer :max_reading
      t.integer :first_reading

      t.timestamps
    end
  end
end
