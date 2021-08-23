class LikesController < ApplicationController
  def index
    likes = Like.all
    render json: likes
  end

  def create
    like = Like.new(
      user_id: params[:user_id],
      post_id: params[:post_id],
    )
    if like.save
      render json: like
    else
      render json: { error: like.errors.full_messages }
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    render json: { message: "Like successfully deleted" }
  end
end
