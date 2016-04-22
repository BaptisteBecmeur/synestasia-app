class Categorization < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
  validates_uniqueness_of :category_id, scope: :post_id
end
