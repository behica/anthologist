class Collection < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  after_create :award_collection
  
  def award_collection
    collections = user.collections.count
    if collections == 1
      user.award_badge('got-one')
    elsif collections == 5
      user.award_badge('fancier')
    elsif collections == 10
      user.award_badge('hoarder')
    end
  end
end
