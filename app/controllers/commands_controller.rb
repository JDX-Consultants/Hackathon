class CommandsController < ApplicationController

    def get
        cmd = Command.first
        render json: cmd ? cmd : {left: 0, right: 0, duration: 0, scan:false}
        Command.delete_all# unless cmd.left > 0  and cmd.right > 0
    end

    def image
        render partial: 'image'
    end

    def view
        image = params[:file]
        file_path = Rails.root.join('app', 'assets', 'images', 'last_image.jpg')
        File.open(file_path, 'wb') { |file| file.write(image.read) }
        command = "alpr -j #{file_path}"
        res_json = `#{command}`
        puts "Results found: #{res_json}"
        result = JSON.parse res_json
        if result['results'].size < 1
            puts "Nothing found"
            flash[:notice] = 'No plate identified'
        else
            found_plate, searched_number = nil, nil
            result['results'][0]['candidates'].each do |result|
                unless found_plate
                    searched_number ||= result['plate']
                    found_plate = ValidPlate.match?(searched_number)
                end
            end
            puts "Plate found: '#{found_plate.inspect}'"
            ScannedPlate.store_scan(searched_number, found_plate)
        end
        render plain: 'OK'
    end

    def update
        Command.delete_all
        Command.create(params.permit(:left, :right, :duration, :scan))
        redirect_to command_path
    end

    def create
        Command.delete_all
        Command.create(params[].permit(:left, :right, :duration, :scan))
        redirect_to command_path
    end

    def scan
        file_path = Rails.root.join('app', 'assets', 'images', 'last_image.jpg')
        command = "alpr -j #{file_path}"
        res_json = `#{command}`
        puts "Results found: #{res_json}"
        result = JSON.parse res_json
        if result['results'].size < 1
            puts "Nothing found"
            flash[:notice] = 'No plate identified'
        else
            found_plate, searched_number = nil, nil
            result['results'][0]['candidates'].each do |result|
                unless found_plate
                    searched_number = result['plate']
                    found_plate = ValidPlate.match?(searched_number)
                end
            end
            puts "Plate found: '#{found_plate.inspect}'"
            ScannedPlate.store_scan(searched_number, found_plate)
        end

            redirect_to command_path
    end
end
