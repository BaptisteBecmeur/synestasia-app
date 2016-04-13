class Sentence < ActiveRecord::Base


	## relations ###############
		has_many :sentence_symboles, :class_name => "SentenceSymbole", :foreign_key => "sentence_id", dependent: :destroy
	## relations ###############


	## accessors ###############
		#does not work for a sentence with a symbole used more than once
	  	#def symboles
	  	#	Symbole.where(id: sentence_symboles.order(:position).pluck(:symbole_id))
	  	#end

	  	def symbole(position)
	  		Symbole.where(id: sentence_symboles.where(position: position).try(:first).try(:symbole_id)).try(:first)
	  	end
	## accessors ###############

end
