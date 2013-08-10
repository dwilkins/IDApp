class RoomTenantLinksController < ApplicationController
  before_action :set_room_tenant_link, only: [:show, :edit, :update, :destroy]

  # GET /room_tenant_links
  # GET /room_tenant_links.json
  def index
    @room_tenant_links = RoomTenantLink.all.page params[:page]
  end

  # GET /room_tenant_links/1
  # GET /room_tenant_links/1.json
  def show
  end

  # GET /room_tenant_links/new
  def new
    @room_tenant_link = RoomTenantLink.new
  end

  # GET /room_tenant_links/1/edit
  def edit
  end

  # POST /room_tenant_links
  # POST /room_tenant_links.json
  def create
    @room_tenant_link = RoomTenantLink.new(room_tenant_link_params)

    respond_to do |format|
      if @room_tenant_link.save
        format.html { redirect_to @room_tenant_link, notice: 'Room tenant link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @room_tenant_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @room_tenant_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_tenant_links/1
  # PATCH/PUT /room_tenant_links/1.json
  def update
    respond_to do |format|
      if @room_tenant_link.update(room_tenant_link_params)
        format.html { redirect_to @room_tenant_link, notice: 'Room tenant link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @room_tenant_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_tenant_links/1
  # DELETE /room_tenant_links/1.json
  def destroy
    @room_tenant_link.destroy
    respond_to do |format|
      format.html { redirect_to room_tenant_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_tenant_link
      @room_tenant_link = RoomTenantLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_tenant_link_params
      params.require(:room_tenant_link).permit(:room_id, :tenant_id, :start_date, :end_date)
    end
end
