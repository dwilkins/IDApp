class GeometriesController < ApplicationController
  before_action :set_geometry, only: [:show, :edit, :update, :destroy]

  # GET /geometries
  # GET /geometries.json
  def index
    @geometries = Geometry.all
  end

  # GET /geometries/1
  # GET /geometries/1.json
  def show
  end

  # GET /geometries/new
  def new
    @geometry = Geometry.new
  end

  # GET /geometries/1/edit
  def edit
  end

  # POST /geometries
  # POST /geometries.json
  def create
    @geometry = Geometry.new(geometry_params)

    respond_to do |format|
      if @geometry.save
        format.html { redirect_to @geometry, notice: 'Geometry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @geometry }
      else
        format.html { render action: 'new' }
        format.json { render json: @geometry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geometries/1
  # PATCH/PUT /geometries/1.json
  def update
    respond_to do |format|
      if @geometry.update(geometry_params)
        format.html { redirect_to @geometry, notice: 'Geometry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @geometry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geometries/1
  # DELETE /geometries/1.json
  def destroy
    @geometry.destroy
    respond_to do |format|
      format.html { redirect_to geometries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geometry
      @geometry = Geometry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geometry_params
      params.require(:geometry).permit(:room_id, :geometry)
    end
end
