class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.integer :architect_id
      t.string :apn
      t.string :year
      t.string :address1
      t.string :city
      t.string :zip
      t.string :family
      t.string :building_type
      t.string :status
      t.string :source
      t.string :notes
      t.string :gsv
      t.integer :key

      t.timestamps
    end
  end
end
