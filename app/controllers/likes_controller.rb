# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :find_image
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = 'Only 1 like for 1 photo!'
    else
      @image.likes.create(user_id: current_user.id)
      user_activity('like')
    end
    redirect_to image_path(@image)
  end

  def destroy
    @like.destroy!
    redirect_to image_path(@image)
  end

  private

  def find_image
    @image = Image.find(params[:image_id])
  end

  def find_like
    @like = @image.likes.where(user_id: current_user.id).first
  end

  def already_liked?
    Like.where(user_id: current_user.id,
               image_id: params[:image_id]).exists?
  end
end
