class RoomAttributesController < ApplicationController
  before_action :set_room_attribute, only: [:show, :edit, :update, :destroy]

  # GET /room_attributes
  # GET /room_attributes.json
  def index
    @room_attributes = RoomAttribute.all.page params[:page]
  end

  # GET /room_attributes/1
  # GET /room_attributes/1.json
  def show
  end

  # GET /room_attributes/new
  def new
    @room_attribute = RoomAttribute.new
  end

  # GET /room_attributes/1/edit
  def edit
  end

  # POST /room_attributes
  # POST /room_attributes.json
  def create
    @room_attribute = RoomAttribute.new(room_attribute_params)

    respond_to do |format|
      if @room_attribute.save
        format.html { redirect_to @room_attribute, notice: 'Room attribute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @room_attribute }
      else
        format.html { render action: 'new' }
        format.json { render json: @room_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_attributes/1
  # PATCH/PUT /room_attributes/1.json
  def update
    respond_to do |format|
      if @room_attribute.update(room_attribute_params)
        format.html { redirect_to @room_attribute, notice: 'Room attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_attributes/1
  # DELETE /room_attributes/1.json
  def destroy
    @room_attribute.destroy
    respond_to do |format|
      format.html { redirect_to room_attributes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_attribute
      @room_attribute = RoomAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_attribute_params
      params.require(:room_attribute).permit(:name, :abbreviation)
    end
end
