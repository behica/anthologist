class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  after_create :award_newcomer
  after_create :award_founder
         
  has_many :stories
  has_many :comments
  has_many :collections, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :achievements, dependent: :destroy
  
  
  def collection_check(story)
    collections.where(story_id: story.id).first
  end
  
  def award_badge(name)
    badge = Badge.find_by_name(name)
    unless self.achievements.find_by_badge_id(badge.id)
      self.achievements.create(badge: badge)
    end
  end
  
  def award_newcomer
    award_badge('newcomer')
  end
  
  def award_founder
    award_badge('founder') if user.id <= 100
  end
end
