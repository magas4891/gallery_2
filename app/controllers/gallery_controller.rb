class GalleryController < ApplicationController
  def index
    @gallery = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to gallery_path
    else
      render :new
    end
  end


  private

  def gallery_params
    params.require(:gallery).permit(:title, :description)
  end
end
