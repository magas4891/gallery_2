class ImagesController < ApplicationController


  # before_action :set_image, only: [:show, :edit, :update]


  def index
  end

  def show
    @image = Image.find(params[:id])
    @category_id = @image.category_id
    @comments = @image.comments
    @likes = @image
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.new(image_params)
    # @category = Category.find(params[:id])
    # puts @category

    # @image.save!
    if @image.save
      # @image = Image.find(params[:id])
      redirect_to image_path(@image)
    else
      flash[:alert] = 'Image did not save'
      render 'new'
    end
  end

  private

  # def set_image
  #   @image = Image.find(params[:id])
  # end

  def image_params
    params.require(:image).permit(:title, :category_id, :picture)
  end
end
