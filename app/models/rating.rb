class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  after_create :award_like
  
  def award_like
    likes = user.ratings.count
    if likes == 1
      user.award_badge('critic')
    elsif likes == 10
      user.award_badge('analyst')
    elsif likes == 20
      user.award_badge('reviewer')
    end
  end
end
