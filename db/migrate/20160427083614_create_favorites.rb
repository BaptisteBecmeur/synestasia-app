class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :favoritable_id
      t.string :favoritable_type

      t.timestamps null: false
    end
  end
end
