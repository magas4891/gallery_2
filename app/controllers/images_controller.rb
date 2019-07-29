class ImagesController < ApplicationController

  before_action :set_image, only: [:show, :edit, :update]

  def index
  end

  def show
    # @image = Image.find(params[:id])
    @comments = @image.comments
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.new(image_params)
    @category = Category.friendly.find(params[:id])

    @image.save!
    if @image.save
      redirect_to :back
    else
      flash[:alert] = 'Image did not save'
      render 'new'
    end
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :category_id, :picture)
  end
end
