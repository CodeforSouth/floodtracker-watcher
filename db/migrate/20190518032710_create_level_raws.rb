class CreateLevelRaws < ActiveRecord::Migration[5.2]
  def change
    create_table :level_raws do |t|
      t.float :readings, array: true

      t.string :coreid, index: true
      t.column :published_at, :timestamptz

      t.timestamps
    end
  end
end
