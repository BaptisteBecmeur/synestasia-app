class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :cover
      t.string :subtitle
      t.string :title
      t.text :introduction
      t.text :body
      t.text :conclusion
      t.string :tag
      t.string :source
      t.string :link
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
