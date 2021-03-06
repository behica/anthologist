class StoriesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  
  def index
    @genres = Story.genres
    @tiers = Story.tiers
    @stories = Story.by_tier_and_genre(params[:tier], params[:genre])
  end

  def show
    @story = Story.find(params[:id])
    @price = @story.price.to_i
    @user = @story.user.username
  end

  def new
    @story = Story.new
    @genres = Story.genres
  end
  
  def create
    @story = Story.new(story_params)
    @story.author = current_user.username
    @story.user = current_user
    
    if @story.save
      check_achievement
      redirect_to @story, notice: "Your story has been saved."
    else
      flash.now[:alert] = "Something went wrong creating your story. Please try again."
      render :new
    end
  end  
    
  def edit
    @story = Story.find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    @story.assign_attributes(story_params)
    
    if @story.save
      redirect_to @story, notice: "Your story has been updated."
    else
      flash.now[:alert] = "Something went wrong with the update. Please try again."
      render :new
    end
  end
  
  def destroy
    @story = Story.find(params[:id])
    
    if @story.destroy
      flash[:notice] = "#{@story.title} was deleted"
      redirect_to stories_path
    else
      flash.now[:alert] = "There was an error deleting the story."
      render :show
    end
  end
  
  private
  
  def story_params
    params.require(:story).permit(:title, :body, :genre, :published, :cover, :user, :price, :tier)
  end
  
  def check_achievement
    stories = current_user.stories.count
    current_user.award_badge('rookie') if stories == 1
    current_user.award_badge('contributor') if stories == 5
    current_user.award_badge('author') if stories == 10
  end
end
