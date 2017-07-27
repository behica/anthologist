class User < ActiveRecord::Base
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :stories
  has_many :comments
  has_many :collections, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :badges, dependent: :destroy
  
  def collection_check(story)
    collections.where(story_id: story.id).first
  end
end
