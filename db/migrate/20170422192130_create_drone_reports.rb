class CreateDroneReports < ActiveRecord::Migration[5.0]
  def change
    create_table :drone_reports do |t|
      t.string :message
      t.references :catastrophe, foreign_key: true

      t.timestamps
    end
  end
end
