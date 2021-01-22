class BestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @praise = Praise.find(params[:praise_id])
    if !Best.exists?(praise: @praise, post: @post)
      @best = Best.create(user_id: current_user.id, praise_id: @praise.id, post_id: @post.id )
      redirect_to "/posts/#{@praise.post.id}"
    end
  end
end
