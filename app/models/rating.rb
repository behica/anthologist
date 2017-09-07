class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  after_create :check_achievement
  
  def check_achievement
    likes = user.ratings.count
    user.award_badge('thumb-up') if likes == 1
    user.award_badge('reviwer') if likes == 5
    user.award_badge('critic') if likes == 20
    user.award_badge('all-thumbs') if likes == 100
  end
end
