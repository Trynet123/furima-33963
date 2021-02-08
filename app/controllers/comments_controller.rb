class CommentsController < ApplicationController
  # def create
  #   comment = Comment.new(text: params[:comment][:text])
  #   if comment.save
  #     ActionCable.server.broadcast 'comment_channel', content: comment
  #     render item_path(comment.item.id)
  #   end
  # end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      # @item = Item.find(params[:item_id])
      # @comments = @item.comments.includes(:user)
      # ActionCable.server.broadcast 'comment_channel', content: comment
      # render item_path(comment.item.id)
      redirect_to item_path(comment.item.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
