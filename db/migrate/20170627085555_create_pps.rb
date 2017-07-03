class CreatePps < ActiveRecord::Migration[5.1]
  def change
    create_table :pps do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :lat_dir, limit: 1
      t.string :long_dir, limit: 1
      t.integer :pos
      
      t.timestamps
    end
  end
end
