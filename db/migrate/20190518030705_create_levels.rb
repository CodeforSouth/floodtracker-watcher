class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.integer :reading

      t.string :coreid, index: true
      t.column :published_at, :timestamptz

      t.timestamps
    end
  end
end
