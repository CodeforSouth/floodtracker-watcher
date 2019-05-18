class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.float :reading

      t.string :coreid, index: true
      t.column :published_at, :timestamptz

      t.timestamps
    end
  end
end
