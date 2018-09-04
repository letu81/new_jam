class PartnersController < ApplicationController
  def index
    @partners = Partner.visible.page(params[:page]).per(15)

    @carousels = []
    home_carousels = Carousel.visible.partners.limit(1)
    unless home_carousels.empty?
      @carousels = home_carousels[0].images
    end

    respond_to do |format|
      format.html
      format.json
    end
    
    render layout: false
  end
end