class Image < ActiveRecord::Base
  belongs_to :product
  validates :image_url, presence: true
end
