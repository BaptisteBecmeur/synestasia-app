class CreateSymboles < ActiveRecord::Migration
  def change
    create_table :symboles do |t|
      t.string :lang
      t.string :example_fr

      t.timestamps null: false
    end
  end
end
