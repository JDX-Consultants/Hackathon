class CreateScannedPlates < ActiveRecord::Migration[5.1]
    def change
        create_table :scanned_plates do |t|
            t.string :number
            t.string :status
            t.integer :valid_plate_id
            t.datetime :last_checked

            # t.timestamps
        end
    end
end
