class Collection < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  after_create :check_achievement
  
  def check_achievement
    collection = user.collections.count
    user.award_badge('got-one') if collection == 1
    user.award_badge('fancier') if collection == 5
    user.award_badge('collector') if collection == 20
    user.award_badge('hoarder') if collection == 100
  end
end
