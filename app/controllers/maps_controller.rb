class MapsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def navbar
    render partial: 'application/navbar'
  end

  def logo
    render partial: 'application/logo', layout: false
  end
end
