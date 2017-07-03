class ScannedPlate < ApplicationRecord

    VALID = 'V'
    UNKNOWN = 'U'

    belongs_to :valid_plate, optional: true


    def self.store_scan(number, valid_plate)
        if number
            scanned_plate = ScannedPlate.where(number: number).first || ScannedPlate.new(number: number)
            scanned_plate.last_checked = DateTime.now
            if valid_plate
                scanned_plate.valid_plate = valid_plate
                scanned_plate.status = ScannedPlate::VALID
            else
                scanned_plate.status = ScannedPlate::UNKNOWN
            end
            scanned_plate.save!
        end
    end
end
