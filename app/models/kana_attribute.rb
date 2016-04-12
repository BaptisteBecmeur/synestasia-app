class KanaAttribute < ActiveRecord::Base
	belongs_to :symboles
	validates :hiragana_value, :katakana_value, :fr, :presence => true
end
