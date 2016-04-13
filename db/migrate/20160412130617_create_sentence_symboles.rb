class CreateSentenceSymboles < ActiveRecord::Migration
  def change
    create_table :sentence_symboles do |t|
      t.integer :sentence_id
      t.integer :symbole_id
      t.integer :position
      t.timestamps null: false
    end
  end
end
