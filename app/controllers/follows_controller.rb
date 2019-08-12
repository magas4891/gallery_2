class FollowsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :find_category
  before_action :pre_follow, only: [:destroy]

  def create
    if already_foolowed?
      flash[:notice] = 'You cant follow again'
    else
      @category.follows.create(user_id: current_user.id)
      Resque.enqueue(FollowMail, current_user, @category)
      user_activity('follow')
    end
    redirect_to category_path(@category)
  end

  def destroy
    @follow.destroy
    redirect_to category_path(@category)
  end

  private

  def find_category
    @category = Category.friendly.find(params[:category_id])
  end

  def pre_follow
    @follow = @category.follows.where(user_id: current_user.id).first
  end

  def already_foolowed?
    Follow.where(user_id: current_user.id,
                 category_id: params[:id]).exists?
  end
end
