class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :stories
  has_many :collections, dependent: :destroy
  
  def collection_for(story)
    collections.where(story_id: story.id).first
  end
end
