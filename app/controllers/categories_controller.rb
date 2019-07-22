class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @images = @category.images
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

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
