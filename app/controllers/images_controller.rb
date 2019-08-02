class ImagesController < ApplicationController


  # before_action :set_image, only: [:show, :edit, :update]


  def index
  end

  def show
    @image = Image.find(params[:id])
    @category_id = @image.category_id
    @comments = @image.comments
  end

  def new
    @image = Image.new
  end

  def create
    @category = Category.friendly.find(params[:image][:category_id])
    @image = current_user.images.new(image_params)
    @image.category_id = @category.id
    @image.save!
    if @image.save
      flash[:success] = 'Image created'
      redirect_to image_path(@image)
    else
      flash[:alert] = 'Image did not save'
      render 'new'
    end
  end

  def destroy
    @category = Category.friendly.find(params[:category_id])
    @image = @category.images.find(params[:id])
    @image.destroy
    redirect_to categories_path
  end

  private

  # def set_image
  #   @image = Image.find(params[:id])
  # end

  def image_params
    params.require(:image).permit(:title, :category_id, :picture)
  end
end
