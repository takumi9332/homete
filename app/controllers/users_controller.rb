class UsersController < ApplicationController
  before_action :set_user

  def show
    @name = @user.name
    @posts = @user.posts.order("created_at DESC")
  end

  def edit
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :image, :self_introduction)
  end
end
