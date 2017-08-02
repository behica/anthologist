class AchievementsController < ApplicationController
  def index
    @achievements = current_user.achievements
    @progress = ((current_user.achievements.count.to_f / Badge.count) * 100).round(0)
  end
end