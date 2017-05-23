class AddLocationToCatastrophes < ActiveRecord::Migration[5.0]
  def change
    add_column :catastrophes, :location, :string
  end
end
