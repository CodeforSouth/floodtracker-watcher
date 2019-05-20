class CreateSleepPlanHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :sleep_plan_histories do |t|
      t.date :date
      t.string :coreid
      t.integer :sleep_count
      t.column :first_publish, :timestamptz
      t.integer :last_id
      t.integer :min_plan
      t.float :mean_reading
      t.integer :total_plan
      t.integer :max_plan

      t.timestamps
    end
  end
end
