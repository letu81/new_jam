class CustomizesController < ApplicationController
  def index
    @products = CustomizeProduct.visible.page(params[:page]).per(12)
    @carousels = []
    home_carousels = Carousel.visible.customizes.limit(1)
    unless home_carousels.empty?
      @carousels = home_carousels[0].images
    end

    respond_to do |format|
      format.html
      format.json
    end

    render layout: false
  end

  def show
    @product = CustomizeProduct.find(params[:id])
    if @product
      @hot_products = CustomizeProduct.visible.not([@product.id]).limit(2)
    else
      @hot_products = CustomizeProduct.visible.limit(2)
    end

    respond_to do |format|
      format.html
      format.json
    end

    render layout: false
  end
end