class PlateController < ApplicationController


    def validate
        puts "Posting a new plate from #{request.remote_ip}, value is: #{params.inspect}"
        plate = params[:plate]
        scanned_plate = ScannedPlate.where(number: plate).first
        valid_plate = ValidPlate.where(number: plate).first
        scanned_plate ||= ScannedPlate.new(number: plate)
        scanned_plate.last_checked = DateTime.now
        if valid_plate
            scanned_plate.valid_plate = valid_plate
            scanned_plate.status = ScannedPlate::VALID
        else
            scanned_plate.status = ScannedPlate::UNKNOWN
        end
        scanned_plate.save!
        render plain: 'OK'
    end

end
