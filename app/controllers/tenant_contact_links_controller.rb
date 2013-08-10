class TenantContactLinksController < ApplicationController
  before_action :set_tenant_contact_link, only: [:show, :edit, :update, :destroy]

  # GET /tenant_contact_links
  # GET /tenant_contact_links.json
  def index
    @tenant_contact_links = TenantContactLink.all.page params[:page]
  end

  # GET /tenant_contact_links/1
  # GET /tenant_contact_links/1.json
  def show
  end

  # GET /tenant_contact_links/new
  def new
    @tenant_contact_link = TenantContactLink.new
  end

  # GET /tenant_contact_links/1/edit
  def edit
  end

  # POST /tenant_contact_links
  # POST /tenant_contact_links.json
  def create
    @tenant_contact_link = TenantContactLink.new(tenant_contact_link_params)

    respond_to do |format|
      if @tenant_contact_link.save
        format.html { redirect_to @tenant_contact_link, notice: 'Tenant contact link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tenant_contact_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @tenant_contact_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenant_contact_links/1
  # PATCH/PUT /tenant_contact_links/1.json
  def update
    respond_to do |format|
      if @tenant_contact_link.update(tenant_contact_link_params)
        format.html { redirect_to @tenant_contact_link, notice: 'Tenant contact link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tenant_contact_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenant_contact_links/1
  # DELETE /tenant_contact_links/1.json
  def destroy
    @tenant_contact_link.destroy
    respond_to do |format|
      format.html { redirect_to tenant_contact_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_contact_link
      @tenant_contact_link = TenantContactLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_contact_link_params
      params.require(:tenant_contact_link).permit(:tenant_id, :contact_id, :start_date, :end_date)
    end
end
