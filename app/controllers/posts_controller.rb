class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.includes(:categories).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    end
  end

  def show; end

  def edit; end
  
  def update
    if @post.update(post_params)
      redirect_to posts_path
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
