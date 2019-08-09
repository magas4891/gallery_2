class FollowsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :find_category
  before_action :find_follow, only: [:destroy]

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
    if !(already_foolowed?)
      flash[:notice] = 'Cannot unfollow'
    else
      @follow.destroy
    end
    redirect_to category_path(@category)
  end

  private

  def find_category
    @category = Category.friendly.find(params[:category_id])
    puts'========================================================='
    puts "#{@category}"
    puts'========================================================='
  end

  def find_follow
    @follow = @category.follows.where(params[:id])
    @follow.category_id = @category.id
    puts'========================================================='
    puts "#{@follow}"
    puts'========================================================='
  end

  def already_foolowed?
    Follow.where(user_id: current_user.id,
                 category_id: params[:id]).exists?
  end
end
