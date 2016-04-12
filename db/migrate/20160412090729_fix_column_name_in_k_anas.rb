class FixColumnNameInKAnas < ActiveRecord::Migration
  def change
  	rename_column :kana_attributes, :hirahana_value, :hiragana_value
  	rename_column :kana_attributes, :katagana_value, :katakana_value
  end
end
