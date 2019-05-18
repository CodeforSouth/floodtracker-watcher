class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.float :reading

      t.timestamps
    end
  end
end
