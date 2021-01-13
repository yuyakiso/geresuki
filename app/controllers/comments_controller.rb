class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/gerendes/#{comment.gerende_id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id, gerende_id: params[:gerende_id])
  end
end
