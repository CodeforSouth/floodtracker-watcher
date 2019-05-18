class CreateSleepPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :sleep_plans do |t|
      t.integer :plan

      t.timestamps
    end
  end
end
