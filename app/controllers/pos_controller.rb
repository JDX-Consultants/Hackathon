class PosController < ApplicationController

    def create
        pos = Position.new(params.permit(:longitude, :latitude, :speed, :scan))
        pos.moment = DateTime.now
        pos.save!
        render plain: 'OK'
    end

    def filter
        @positions = Position.all
        @positions = @positions.with_name(params[:start_time]) if params[:start_time].present?
        @positions = @positions.from_company(params[:end_time]) if params[:end_time].present?
        render partial: 'user_list'
    end

end
