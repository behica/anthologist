class Story < ActiveRecord::Base
  has_many :collections, dependent: :destroy
  
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
  validates :body, length: {minimum: 5, too_short: "Your story must be at least %{count} words long.", maximum: 450, too_long: "Your story must not exceed %{count} words.", presence: true, tokenizer: ->(str) { str.scan(/\w+/) } }
  validates :genre, presence: true
  validates :author, presence: true
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  
  def genres
    @genres = ['Fan fiction', 'Fantasy', 'Mystery', 'Romance', 
    'Sci-fi', 'Western', 'Horror']
  end
end
