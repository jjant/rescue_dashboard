class AddAffectedBuildingsToCatastrophes < ActiveRecord::Migration[5.0]
  def change
    add_column :catastrophes, :affected_buildings, :string
    add_column :catastrophes, :people_rescued, :string
    add_column :catastrophes, :building_rescued, :string
    add_column :catastrophes, :surface_covered, :string
  end
end
