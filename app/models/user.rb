class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  after_create :founder_badge
  after_create :newcomer_badge
         
  has_many :stories
  has_many :comments, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :purchases
  
  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}
  
  def collection_check(story)
      collections.where(story_id: story.id).first
  end
  
  def purchase?(story)
    purchases.where(story_id: story.id).first
  end
  
  def to_param
    username
  end
  
  def award_badge(name)
    badge = Badge.find_by_name(name)
    unless self.achievements.find_by_badge_id(badge.id)
     self.achievements.create(badge: badge)
    end
  end
  
  def unearned_achievements
    if self.achievements.nil?
      unearned_badges = Badge.all
    else
      unearned_badges = []
      Badge.all.each do |badge|
      unearned_badges << badge unless self.achievements.find_by_badge_id(badge.id)
      end
      unearned_badges.shift
    end
    unearned_badges
  end
  
  def founder_badge
    award_badge('founder') if id <= 100
  end
  
  def newcomer_badge
    award_badge('newcomer')
  end
end
