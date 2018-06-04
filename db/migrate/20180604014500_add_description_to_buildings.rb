class AddDescriptionToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :description, :string
  end
end
