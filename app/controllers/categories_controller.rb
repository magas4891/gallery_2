class CategoriesController < ApplicationController

  # before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.order(:name).page params[:page]
  end

  def show
    @category = Category.find(params[:id])
    @images = @category.images
    @images = @images.page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_slug])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
