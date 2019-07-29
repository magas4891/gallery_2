class CommentsController < ApplicationController

  # def show
  #   @comment = Comment.find(params[:image_id])
  # end

  def new

  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_to image_path(@image)
    end

    # @comment = Comment.new(comments_params)
    # @comment.user = current_user
    # # @comment = current_user.comments.build(comments_params)
    # # @comment.save!
    #
    # @comment.save!
    # render plain: params[:comment].inspect
  end

  private

  def comments_params
    params.require(:comment).permit(:commenter, :text, :user_id, :image_id)
  end

end
