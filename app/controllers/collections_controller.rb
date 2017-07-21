class CollectionsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    story = Story.find(params[:story_id])
    collection = current_user.collections.build(story: story)
    
    if collection.save
      flash[:notice] = "Story added to collection."
    else
      flash[:alert] = "Something went wrong. Try again."
    end
    
    redirect_to :back
  end
  
  def destroy
    story = Story.find(params[:story_id])
    collection = current_user.collections.find(params[:id])
    
    if collection.destroy
       flash[:notice] = "Story removed from collection."
    else
       flash[:alert] = "Something went wrong. Try again."
    end
    
    redirect_to :back
  end
  
  
  def index
  	@user_collections = current_user.collections
  end
end