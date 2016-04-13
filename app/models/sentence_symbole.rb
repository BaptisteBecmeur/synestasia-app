class SentenceSymbole < ActiveRecord::Base
	

	## relations ###############
		belongs_to :symbole
		belongs_to :sentence
	## relations ###############

	
end
