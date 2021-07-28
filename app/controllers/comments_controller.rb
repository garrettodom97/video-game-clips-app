class CommentsController < ApplicationController
  def create
    comment = Comment.new(
      user_id: current_user.id,
      post_id: params[:post_id],
      text: params[:text],
    )
    if comment.save
      render json: comment
    else
      render json: { error: comment.errors.full_messages }
    end
  end
end
