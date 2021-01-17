class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/gerendes/#{comment.gerende_id}"
  end

  def destroy
    @gerende = Gerende.find(params[:id])
    @comment = Comment.find(params[:id])
    if @comment.user.id != current_user.id
      redirect_to action: index
    end
    @comment.destroy
    redirect_to @gerende
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id, gerende_id: params[:gerende_id])
  end
end
