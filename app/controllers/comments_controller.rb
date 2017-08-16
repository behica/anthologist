class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @story = Story.find(params[:story_id])
    comment = @story.comments.new(comment_params)
    comment.user = current_user
    
    if comment.save
      check_achievement
      flash[:notice] = "Your comment has been added."
      redirect_to @story
    else
      flash.now[:alert] = "Something went wrong adding your comment. Please try again."
      redirect_to @story
    end
  end
  
  def destroy
    @story = Story.find(params[:story_id])
    
    if comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to @story
    else
      flash.now[:alert] = "There was an error deleting the comment."
      redirect_to @story
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def check_achievement
    comments = current_user.comments.count
    current_user.award_badge('peanut') if comments == 1
    current_user.award_badge('commentator') if comments == 10
    current_user.award_badge('pundit') if comments == 25
  end
end
