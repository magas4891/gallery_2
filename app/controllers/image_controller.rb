class ImageController < ApplicationController
  def index
    @image = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

end
