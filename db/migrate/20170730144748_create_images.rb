class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :filename
      t.integer :building_id

      t.timestamps
    end
  end
end
