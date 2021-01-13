class GerendesController < ApplicationController
  before_action :set_gerende, only: [:show]
  def index
    @gerendes = Gerende.all.page(params[:page])
  end

  def search
    @gerendes = Gerende.search(params)
  end

  def show
    @comment = Comment.new
    @comments = @gerende.comments.includes(:user)
  end

  private
  def set_gerende
    @gerende = Gerende.find(params[:id])
  end
end
