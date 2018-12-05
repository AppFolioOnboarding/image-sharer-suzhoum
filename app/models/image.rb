class Image < ApplicationRecord
  URL_REGEX = %r{(https?:\/\/.*\.(?:png|jpg|gif|tif))}i
  validates :image_url, format: { with: URL_REGEX, message: 'is invalid URL for image' }
  acts_as_taggable_on :tags
end
