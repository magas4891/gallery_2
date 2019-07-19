class ImagesController < ApplicationController
  def index
    @image = Image.order('created_at DESC')
  end

  def show
  end

  def new
    # @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to category_images_path
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:images).permit(:name, :picture)
  end
end
