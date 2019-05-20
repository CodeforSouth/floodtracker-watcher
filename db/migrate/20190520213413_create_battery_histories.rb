class CreateBatteryHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :battery_histories do |t|
      t.date :date
      t.string :coreid
      t.integer :count
      t.column :first_publish, :timestamptz
      t.integer :last_id
      t.float :min_reading
      t.float :mean_reading
      t.float :stddev_reading
      t.float :max_reading
      t.float :first_reading

      t.timestamps
    end
  end
end
