class BaselayersController < ApplicationController
  before_action :set_baselayer, only: [:show, :edit, :update, :destroy]

  # GET /baselayers
  # GET /baselayers.json
  def index
    @baselayers = Baselayer.all
  end

  # GET /baselayers/1
  # GET /baselayers/1.json
  def show
  end

  # GET /baselayers/new
  def new
    @baselayer = Baselayer.new
  end

  # GET /baselayers/1/edit
  def edit
  end

  # POST /baselayers
  # POST /baselayers.json
  def create
    @baselayer = Baselayer.new(baselayer_params)

    respond_to do |format|
      if @baselayer.save
        format.html { redirect_to @baselayer, notice: 'Baselayer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @baselayer }
      else
        format.html { render action: 'new' }
        format.json { render json: @baselayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baselayers/1
  # PATCH/PUT /baselayers/1.json
  def update
    respond_to do |format|
      if @baselayer.update(baselayer_params)
        format.html { redirect_to @baselayer, notice: 'Baselayer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @baselayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baselayers/1
  # DELETE /baselayers/1.json
  def destroy
    @baselayer.destroy
    respond_to do |format|
      format.html { redirect_to baselayers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baselayer
      @baselayer = Baselayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baselayer_params
      params.require(:baselayer).permit(:image, :width, :height, :zoomlevels, :tilesize, :name, :description, :domain)
    end
end
