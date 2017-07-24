class RatingsController < ApplicationController
  before_action :authenticate_user!
  
  def like
    @story = Story.find(params[:story_id])
    @rating = @story.ratings.where(user_id: current_user.id).first
 
    if @rating
      @rating.update_attribute(:value, 1)
    else
      @rating = current_user.ratings.create(value: 1, story: @story)
    end
    redirect_to :back
  end
end
