class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    @stories = @user.stories.count
    @collection = @user.collections.count
    @achievements = @user.achievements.count
  end
  
  def index
    @users = User.all
  end
end
