class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_category, only: [:show, :destroy]
  before_action :pre_follow, only: [:show]

  def index
    @categories = Category.where("name != 'NoName'").page params[:page]
    user_activity('showing_index_category') if current_user

  end

  def show
    @images = @category.images
    @images = @images.page params[:page]
    user_activity("showing_category_#{@category.slug}") if current_user

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    @category.rank = 0
    if @category.save
      user_activity('cat_creation') if current_user
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def top
    categories = Category.all
    categories.each do |category|
      images = category.images
      imgs_likes_arr = []
      imgs_cmmnts_arr = []
      images.each do |f|
        imgs_likes_arr.append(f.likes.count)
        imgs_cmmnts_arr.append(f.comments.count)
      end
      category.rank = category.images.count + imgs_likes_arr.sum + imgs_cmmnts_arr.sum
      category.save!
    end
    @top_categories = Category.where("name != 'NoName'").order('rank desc').limit(5)

  end


  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def pre_follow
    @follow_owner = @category.follows.where(user_id: current_user.id).first if current_user
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

  # def imgs_likes_sum
  #   @images = @category.images
  #   @imgs_likes_arr = []
  #   @imgs_cmmnts_arr = []
  #   @images.each do |f|
  #     @imgs_likes_arr.append(f.likes.count)
  #     @imgs_cmmnts_arr.append(f.comments.count)
  #   end
  # end

end
