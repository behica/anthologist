class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  after_create :award_comment
  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  def award_comment
    comments = user.comments.count
    if comments == 1
      user.award_badge('peanut')
    elsif comments == 5
      user.award_badge('commentator')
    elsif comments == 10
      user.award_badge('pundit')
    end
  end
end
