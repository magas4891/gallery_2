class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_category, only: [:show, :destroy]

  def index
    @categories = Category.all.order(:name).page params[:page]
  end

  def show
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

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
