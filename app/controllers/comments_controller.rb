class CommentsController < ApplicationController
  def new
    # @comments = Comment.include(:user)
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:comment][:text])
  end
end
