class Category < ActiveRecord::Base
  include Authority::Abilities

  has_many :posts

end
