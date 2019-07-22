class ImagesController < ApplicationController
  def index
    @image = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    # @image.category = current_category
    if @image.save
      redirect_to category_images_path
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :picture, :category_id)
  end
end
