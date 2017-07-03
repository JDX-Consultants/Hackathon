class ValidPlatesController < ApplicationController
  before_action :set_valid_plate, only: [:show, :edit, :update, :destroy]

  # GET /valid_plates
  # GET /valid_plates.json
  def index
    @valid_plates = ValidPlate.all
  end

  # GET /valid_plates/1
  # GET /valid_plates/1.json
  def show
  end

  # GET /valid_plates/new
  def new
    @valid_plate = ValidPlate.new
  end

  # GET /valid_plates/1/edit
  def edit
  end

  # POST /valid_plates
  # POST /valid_plates.json
  def create
    @valid_plate = ValidPlate.new(valid_plate_params.permit(:owner, :number))
    @valid_plate.light_plate = @valid_plate.number.gsub('-', '')
    respond_to do |format|
      if @valid_plate.save
        format.html { redirect_to @valid_plate, notice: 'Valid plate was successfully created.' }
        format.json { render :show, status: :created, location: @valid_plate }
      else
        format.html { render :new }
        format.json { render json: @valid_plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valid_plates/1
  # PATCH/PUT /valid_plates/1.json
  def update
    respond_to do |format|
      if @valid_plate.update(valid_plate_params.permit(:owner, :number))
        format.html { redirect_to @valid_plate, notice: 'Valid plate was successfully updated.' }
        format.json { render :show, status: :ok, location: @valid_plate }
      else
        format.html { render :edit }
        format.json { render json: @valid_plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valid_plates/1
  # DELETE /valid_plates/1.json
  def destroy
    @valid_plate.destroy
    respond_to do |format|
      format.html { redirect_to valid_plates_url, notice: 'Valid plate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valid_plate
      @valid_plate = ValidPlate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valid_plate_params
      params.fetch(:valid_plate, {})
    end
end
