class CommentsController < ApplicationController

  def new

  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_to image_path(@image)
    end

  end

  private

  def comments_params
    params.require(:comment).permit(:commenter, :text, :user_id, :image_id)
  end

end
