class LikesController < ApplicationController
  before_action :find_image
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = 'Only 1 like for 1 photo!'
    else
      @image.likes.create(user_id: current_user.id)
    end
    redirect_to image_path(@image)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
    redirect_to image_path(@image)
  end

  private

  def find_image
    @image = Image.find(params[:image_id])
  end

  def find_like
    @like = @image.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id,
               image_id: params[:image_id]).exists?
  end
end
