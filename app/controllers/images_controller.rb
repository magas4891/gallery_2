class ImagesController < ApplicationController
  def index
    # @image = Image.all
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to category_image_path
    else
      flash[:alert] = 'Image did not save'
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :category_id, :picture)
  end
end
