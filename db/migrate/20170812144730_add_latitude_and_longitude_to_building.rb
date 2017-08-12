class AddLatitudeAndLongitudeToBuilding < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :latitude, :float
    add_column :buildings, :longitude, :float
  end
end
