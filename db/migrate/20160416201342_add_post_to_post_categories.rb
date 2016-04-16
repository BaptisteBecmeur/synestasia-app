class AddPostToPostCategories < ActiveRecord::Migration
  def change
    add_reference :post_categories, :post, index: true, foreign_key: true
  end
end
