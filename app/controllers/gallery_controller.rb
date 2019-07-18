class GalleryController < ApplicationController
  def index
    @gallery = Gallery.all
  end
end
