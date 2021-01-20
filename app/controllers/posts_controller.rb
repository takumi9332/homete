class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order("RAND()")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @praise = Praise.new
    @praises = @post.praises.includes(:user).order("created_at DESC")
  end

  def edit
    unless current_user.id == @post.user_id
      redirect_to action: :index
    end
  end

  def update
    if @post.update(post_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == @post.user_id
      redirect_to action: :index
    end
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
