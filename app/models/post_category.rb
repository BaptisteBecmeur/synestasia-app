class PostCategory < ActiveRecord::Base
  has_many :posts, dependent: :destroy


  NAMES = ["Japon", "Chine", "Corée du Sud", "Moyen Orient", "Indien"]
  validates :name, inclusion: { in: PostCategory::NAMES, allow_nil: false }
end
