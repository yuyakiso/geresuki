class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/gerendes/#{comment.gerende_id}"
  end

  def destroy
    @gerende = Gerende.find(params[:gerende_id])
    @comment = @gerende.comments.includes(:user)
    @comments = @comment.find(params[:id])
    if @comments.user_id != current_user.id
      redirect_to gerende_path"#{@comments.gerende_id}"
    else
      @comments.destroy
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id, gerende_id: params[:gerende_id])
  end
end
