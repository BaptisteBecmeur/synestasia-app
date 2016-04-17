class PostCategory < ActiveRecord::Base
  belongs_to :post
  # validates :name, presence: true

   NAMES = ["Japon", "Chine", "Corée du Sud", "Moyen-Orient"]
   validates :name, inclusion: { in: PostCategory::NAMES, allow_nil: false }
end
