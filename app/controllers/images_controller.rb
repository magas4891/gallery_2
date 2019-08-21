class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_image, only: [:show]
  before_action :pre_like, only: [:show]
  # before_action :params_for_parser, only: [:parser_save]

  def index
  end

  def show
    # @image = Image.find(params[:id])
    @category_id = @image.category_id
    @comments = @image.comments
    user_activity("showing_image_#{@image.id}")
  end

  def new
    @image = Image.new
  end

  def parser_save
    # @category = Category.find(id: 18)
    # @user = User.find(id: 11)
    @image.save!
  end

  def create
    @category = Category.friendly.find(params[:image][:category_id])
    @image = current_user.images.new(image_params)
    @image.category_id = @category.id
    @image.save!
    if @image.save
      user_activity('img_creation')
      @image.category.follows.each do |followers|
        Resque.enqueue(NewImageEmail, followers.user.email, @category)
      end
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

  def pre_like
    @like_owner = @image.likes.where(user_id: current_user.id).first
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :category_id, :picture, :remote_picture_url)
  end

  # def params_for_parser
  #   params.require(:image).permit(category_id: 18, user_id: 11)
  # end

end
