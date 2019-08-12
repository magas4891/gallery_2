class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_category, only: [:show]
  before_action :pre_follow, only: [:show]

  def index
    @categories = Category.all.order(:name).page params[:page]
    user_activity('showing_index_category')
  end

  def show
    @images = @category.images
    @images = @images.page params[:page]
    user_activity("showing_category_#{@category.slug}")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      user_activity('cat_creation')
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def pre_follow
    @follow_owner = @category.follows.where(user_id: current_user.id).first

  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
