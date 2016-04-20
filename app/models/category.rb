class Category < ActiveRecord::Base

  has_many :posts

  NAMES = ["JAPON", "CHINE", "INDE"]
  validates :name, inclusion: { in: Category::NAMES, allow_nil: false }


end
