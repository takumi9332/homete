class PraisesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_praise, only: [:destroy, :edit, :update]
  before_action :authenticate_user!

  def create
    praise = Praise.create(praise_params)
    redirect_to "/posts/#{praise.post.id}"
  end

  def destroy
    if @praise.user_id == current_user.id
      @praise.destroy
      redirect_to "/posts/#{@praise.post.id}"
    end
  end

  def edit
    if @praise.user_id != current_user.id
      redirect_to "/posts/#{@praise.post.id}"
    end
  end

  def update
    if @praise.update(praise_params)
      redirect_to "/posts/#{@praise.post.id}"
    else
      render :edit
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_praise
    @praise = Praise.find(params[:id])
  end

  def praise_params
    params.require(:praise).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
