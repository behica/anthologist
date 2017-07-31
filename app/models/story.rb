class Story < ActiveRecord::Base
  belongs_to :user
  has_many :collections, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  after_create :check_achievement
  
  has_attached_file :cover,
  :storage => :s3,
  :url => ":s3_domain_url",
  :path => '/:class/:attachment/:id_partition/:style/:filename',
  styles: {
    thumb: '125x200#',
    square: '200x200#'
  },
  default_url: "cover_:style.png"
  
  validates :title, length: {minimum: 5 }, presence: true
  validates :body, length: {minimum: 5, too_short: "Your story must be at least %{count} words long.", maximum: 8000, too_long: "Your story must not exceed %{count} words.", presence: true, tokenizer: ->(str) { str.scan(/\w+/) } }
  validates :genre, presence: true
  validates :author, presence: true
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  
  def self.genres
    ['Fan fiction', 'Fantasy', 'Mystery', 'Romance', 
    'Sci-fi', 'Western', 'Horror']
  end
  
  def likes
    ratings.where(value: 1).count
  end
  
  def check_achievement
    stories = user.stories.count
    user.award_badge('rookie') if stories == 1
    user.award_badge('contributor') if stories == 5
    user.award_badge('author') if stories == 10
  end
end
