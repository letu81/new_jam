class DynamicsController < ApplicationController
  def index
    @dynamics = Dynamic.visible.page(params[:page]).per(10)
    render layout: false
  end

  def show
    @dynamic = Dynamic.find(params[:id])
    render layout: false
  end
end