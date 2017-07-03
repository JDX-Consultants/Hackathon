class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.decimal :speed
      t.datetime :moment

      # t.timestamps
    end
  end
end
