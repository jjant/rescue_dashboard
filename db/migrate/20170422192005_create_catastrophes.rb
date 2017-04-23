class CreateCatastrophes < ActiveRecord::Migration[5.0]
  def change
    create_table :catastrophes do |t|
      t.string :name
      t.string :description
      t.integer :affected_people
      t.integer :affected_surface
      t.integer :drones
      t.string :agents_online
      t.string :integer
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
