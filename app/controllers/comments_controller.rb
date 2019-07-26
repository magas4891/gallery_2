class CommentsController < ApplicationController

  def new

  end

  def create
    @image = Image.find(params[:image_id])
    @comment = Comment.new(comments_params)
    @comment.user = current_user
    # @comment = current_user.comments.build(comments_params)
    # @comment.save!

    @comment.save!

  end

  private

  def comments_params
    params.require(:comment).permit(:commenter, :text, :user_id, :image_id)
  end

end
