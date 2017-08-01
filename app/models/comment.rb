class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  #after_create :check_achievement
  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  def check_achievement
  comments = user.comments.count
  user.award_badge('peanut') if comments == 1
  user.award_badge('commentator') if comments == 10
  user.award_badge('pundit') if comments == 25
  end
end
