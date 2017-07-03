class PpController < ApplicationController

    def create
        pp = PP.new(params.permit(:longitude, :latitude, :long_dir, :lat_dir))
        pp.pos = PP.highest_position + 1
        puts "Creating PP: #{pp.inspect}"
        pp.save!
        render plain: 'OK'
    end

    def delete_all
        PP.delete_all
        redirect_to pp_index_path
    end


end
