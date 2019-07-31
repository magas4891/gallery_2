class FollowsController < ApplicationController
  before_action :find_category
  before_action :find_follow, only: [:destroy]

  def create
    if already_foolowed?
      flash[:notice] = 'You cant follow again'
    else
      @category.follows.create(user_id: current_user.id)
    end
    redirect_to category_path(@category)
  end

  def destroy
    if !(already_foolowed?)
      flash[:notice] = 'Cannot unfollow'
    else
      @follow.destroy
    end
    # @follow.destroy
    redirect_to category_path(@category)
  end

  private

  def find_follow
    @follow = @category.follows.find(params[:id])
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

  def already_foolowed?
    Follow.where(user_id: current_user.id,
                 category_id: params[:category_id]).exists?
  end
end
