class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    posts = Post.all.order("created_at DESC")
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    response = Cloudinary::Uploader.upload(params[:video], resource_type: :auto)
    cloudinary_url = response["secure_url"]

    post = Post.new(
      title: params[:title],
      description: params[:description],
      video: cloudinary_url,
      user_id: current_user.id,
    )
    if post.save
      render json: post
    else
      render json: { error: post.errors.full_messages }, status: 421
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
      render json: { message: "Post successfully deleted" }
    else
      render json: {}, status: :unauthorized
    end
  end
end
