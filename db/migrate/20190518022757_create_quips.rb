class CreateQuips < ActiveRecord::Migration[5.2]
  def change
    create_table :quips do |t|
      t.string :body

      t.string :coreid, index: true
      t.column :published_at, :timestamptz

      t.timestamps
    end
  end
end
