class KanjiAttribute < ActiveRecord::Base
	
	## relations ###############
		belongs_to :symboles
	## relations ###############

	## validations #############
		validates :value, :concept, :fr, :presence => true
	## validations #############

end
