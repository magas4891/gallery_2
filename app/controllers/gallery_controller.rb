class GalleryController < ApplicationController
  def index
    @gallery = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end
end
