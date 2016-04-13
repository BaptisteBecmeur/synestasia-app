class KanaAttribute < ActiveRecord::Base
	

	## relations ###############
		belongs_to :symboles
	## relations ###############


	## validations #############
		validates :hiragana_value, :katakana_value, :fr, :presence => true
	## validations #############

	def value
		hiragana_value + "/" + katakana_value
	end
end
