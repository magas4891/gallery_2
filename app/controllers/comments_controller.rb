class CommentsController < ApplicationController

  def index
    @comments = Comment.all.order('created_at DESC')
  end

  def new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comments_params)
    @comment.user = current_user
    @comment.commenter = current_user.nick
    # if verify_recaptcha
    if @comment.save
      user_activity('comment')
      redirect_to image_path(@image)
      # end
    end


  end

  def destroy
    @image = Image.find(params[:image_id])
    @comment = @image.comments.find(params[:id])
    @comment.destroy
    redirect_to categories_path
  end
  private

  def comments_params
    params.require(:comment).permit(:commenter, :text, :user_id, :image_id)
  end

end
