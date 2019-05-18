class CreateSparkDiagnostics < ActiveRecord::Migration[5.2]
  def change
    create_table :spark_diagnostics do |t|
      t.json :diagnostic

      t.timestamps
    end
  end
end
