class CreateKanjiAttributes < ActiveRecord::Migration
  def change
    create_table :kanji_attributes do |t|
      t.integer :symbole_id
      t.string :value
      t.string :fr
      t.string :concept

      t.timestamps null: false
    end
  end
end
