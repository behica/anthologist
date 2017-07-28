class AchievementsController < ApplicationController
  def index
    @achievements = current_user.achievements
  end
end