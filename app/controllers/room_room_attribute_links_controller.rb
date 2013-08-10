class RoomRoomAttributeLinksController < ApplicationController
  before_action :set_room_room_attribute_link, only: [:show, :edit, :update, :destroy]

  # GET /room_room_attribute_links
  # GET /room_room_attribute_links.json
  def index
    @room_room_attribute_links = RoomRoomAttributeLink.all.page params[:page]
  end

  # GET /room_room_attribute_links/1
  # GET /room_room_attribute_links/1.json
  def show
  end

  # GET /room_room_attribute_links/new
  def new
    @room_room_attribute_link = RoomRoomAttributeLink.new
  end

  # GET /room_room_attribute_links/1/edit
  def edit
  end

  # POST /room_room_attribute_links
  # POST /room_room_attribute_links.json
  def create
    @room_room_attribute_link = RoomRoomAttributeLink.new(room_room_attribute_link_params)

    respond_to do |format|
      if @room_room_attribute_link.save
        format.html { redirect_to @room_room_attribute_link, notice: 'Room room attribute link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @room_room_attribute_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @room_room_attribute_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_room_attribute_links/1
  # PATCH/PUT /room_room_attribute_links/1.json
  def update
    respond_to do |format|
      if @room_room_attribute_link.update(room_room_attribute_link_params)
        format.html { redirect_to @room_room_attribute_link, notice: 'Room room attribute link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room_room_attribute_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_room_attribute_links/1
  # DELETE /room_room_attribute_links/1.json
  def destroy
    @room_room_attribute_link.destroy
    respond_to do |format|
      format.html { redirect_to room_room_attribute_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_room_attribute_link
      @room_room_attribute_link = RoomRoomAttributeLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_room_attribute_link_params
      params.require(:room_room_attribute_link).permit(:room_id, :room_attribute_id, :start_date, :end_date)
    end
end
