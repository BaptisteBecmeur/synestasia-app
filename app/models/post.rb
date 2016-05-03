class Post < ActiveRecord::Base
  belongs_to :user

  belongs_to :category

  TAGS = ["Design", "Mode", "Tendance", "Life-Style", "Tradition", "Gastronomie", "Insolite", "Technologie"]
  validates :tag, inclusion: { in: Post::TAGS, allow_nil: false }

  mount_uploader :cover, ImageUploader
end
