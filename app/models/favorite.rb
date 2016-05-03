class Favorite < ActiveRecord::Base
  # Favorite.create(user_id: User.last.id, favoritable_id: Symbole.last.id, favoritable_type:"Symbole")
  belongs_to :favoritable, polymorphic: true
  belongs_to :user

    validates :user_id, uniqueness: {
    scope: [:favoritable_id, :favoritable_type],
    message: 'can only favorite an item once'
  }
end
