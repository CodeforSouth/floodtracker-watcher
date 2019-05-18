class CreateQuips < ActiveRecord::Migration[5.2]
  def change
    create_table :quips do |t|
      t.string :body

      t.timestamps
    end
  end
end
