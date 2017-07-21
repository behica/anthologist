class Story < ActiveRecord::Base
  has_many :collections, dependent: :destroy
  
  validates :title, length: {minimum: 5 }, presence: true
  validates :body, length: {minimum: 5, too_short: "Your story must be at least %{count} words long.", maximum: 450, too_long: "Your story must not exceed %{count} words.", presence: true, tokenizer: ->(str) { str.scan(/\w+/) } }
  validates :genre, presence: true
  validates :author, presence: true
  
  def genres
    @genres = ['Fan fiction', 'Fantasy', 'Mystery', 'Romance', 
    'Sci-fi', 'Western', 'Horror']
  end
end
