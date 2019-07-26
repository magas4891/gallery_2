class ImagesController < ApplicationController

  def index
  end

  def show
    @image = Image.find(params[:id])
    @comments = @image.comments
  end

  def new
    @image = Image.new
  end

  def create
    # @category = Category.friendly.find(params[:category_id])
    @image = current_user.images.new(image_params)
    @image.save!
    if @image.save
      redirect_to :back
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
