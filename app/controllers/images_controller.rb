class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_image, only: [:show]
  before_action :pre_like, only: [:show]

  def index
    @images = Image.all.page(params[:page]).per(20)
    user_activity("showing_index_images") if current_user
  end

  def show
    @category_id = @image.category_id
    @comments = Comment.where(image_id: @image).order('created_at DESC')
    user_activity("showing_image_#{@image.id}") if current_user
    @activity = Activity.all
  end

  def new
    @image = Image.new
  end

  def create
    @category = Category.friendly.find(params[:image][:category_id])
    @image = current_user.images.new(image_params)
    @image.category_id = @category.id
    # @image.save!
    if @image.save
      user_activity('img_creation') if current_user
      unless Rails.env.test?
        @image.category.follows.each do |followers|
          Resque.enqueue(NewImageEmail, followers.user.email, @category)
        end
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
    @like_owner = @image.likes.where(user_id: current_user.id).first if current_user
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :category_id, :picture, :remote_picture_url)
  end
end
