class NewsController < ApplicationController
  def index
    @posts = Post.visible.page(params[:page]).per(10)
    render layout: false
  end

  def show
    @post = Post.find(params[:id])
    render layout: false
  end
end