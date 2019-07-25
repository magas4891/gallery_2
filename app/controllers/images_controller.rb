class ImagesController < ApplicationController
  # before_action :set_category, only: :create

  def index
  end

  def show
    # @category = Category.find(params[:category_id])
    # puts @category
    # @images = Image.find(params[:category_id])
    @image = Image.find(params[:id])
    puts @image
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    # @image.save!
    if @image.save
      redirect_to categories_path
    else
      flash[:alert] = 'Image did not save'
      render 'new'
    end
  end

  private

  # def set_category
  #   @category = Category.find(params[:image][:category_id])
  # end

  def image_params
    params.require(:image).permit(:title, :category_id, :picture)
  end
end
