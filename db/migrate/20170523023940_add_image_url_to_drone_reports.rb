class AddImageUrlToDroneReports < ActiveRecord::Migration[5.0]
  def change
    add_column :drone_reports, :image_url, :string
  end
end
