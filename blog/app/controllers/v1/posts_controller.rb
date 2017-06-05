class V1::PostsController < ApplicationController
  def index
    @posts = Post.all

    render :index, status: :ok
  end

  def create
    @post = current_user.posts.build(post_params)
    # this will automatically add a user ID to the created post, based on the current_user

    @post.save
    render :create, status: :created
  end

  def destroy
    @post = current_user.posts.where(id: params[:id]).first
    if post.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
