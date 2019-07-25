class CategoriesController < ApplicationController
  before_action :set_category

  def index
    @category = Category.order(:name).page params[:page]
  end

  def show
    # @category = Category.find(params[:id])
    @images = @category.images
    @images = @images.page params[:page]
    # @image = @images.find(params[:id])
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
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
