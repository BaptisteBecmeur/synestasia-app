class RenameHiraganaAndKAtaganaAttributeToKana < ActiveRecord::Migration
  def change
  	rename_table :hiragana_and_katagana_attributes, :kana_attributes
  end
end
