class CreateHiraganaAndKataganaAttributes < ActiveRecord::Migration
  def change
    create_table :hiragana_and_katagana_attributes do |t|
      t.integer :symbole_id
      t.string :hirahana_value
      t.string :katagana_value
      t.string :fr

      t.timestamps null: false
    end
  end
end
