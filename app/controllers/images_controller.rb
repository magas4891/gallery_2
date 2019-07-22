class ImagesController < ApplicationController
  def index
    # @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    # @category = Category.find(category_params)
    @image = current_user.images.build(image_params)
    @image.save!
    if @image.save
      redirect_to categories_path
    else
      flash[:alert] = 'Image did not save'
      render 'new'
    end
  end

  private

  # def set_category
  #   @category = Category.find(params[:category_id])
  # end
  #

  # def category_params
  #   params.require(:category).permit(:category_id)
  # end

  def image_params
    params.require(:image).permit(:title, :category_id, :picture)
  end
end
