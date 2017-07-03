class CreateValidPlates < ActiveRecord::Migration[5.1]
    def change
        create_table :valid_plates do |t|
            t.string :number
            t.string :owner
            t.string :light_plate

            t.timestamps
        end

        add_index :valid_plates, :light_plate, unique: true

    end
end
