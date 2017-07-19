class Story < ActiveRecord::Base
  has_many :collections, dependent: :destroy
end
