class Symbole < ActiveRecord::Base
	include Authority::Abilities
	self.authorizer_name = 'SymboleAuthorizer'

	## relations ###############
		has_one :kana_attribute, :class_name => "KanaAttribute", :foreign_key => "symbole_id", dependent: :destroy
		accepts_nested_attributes_for :kana_attribute, :allow_destroy => true
		has_one :kanji_attribute, :class_name => "KanjiAttribute", :foreign_key => "symbole_id", dependent: :destroy
		accepts_nested_attributes_for :kanji_attribute, :allow_destroy => true
		has_many :sentence_symboles, :class_name => "SentenceSymbole", :foreign_key => "symbole_id"
	## relations ###############
	

	## scopes ##################
		## languages 
			scope :jp, -> { where(lang: 'Japonais')}

		## types 
			scope :kanas , -> { where(symbole_type: 'kana')}
			scope :kanjis , -> { where(symbole_type: 'kanji')}
	## scopes ##################


	## validations #############
		validate do
	      check_specific_attributes
	  	end
	  	validates :lang, :symbole_type, :presence => true
  	## validations #############


  	## validate methods ########
		def check_specific_attributes
			errors.add(:base, "Informations manquantes") unless specific_attributes.present?
		end
	## validate methods ########


  	## accessors ###############
	  	def hiragana_value
	  		specific_attributes.try(:hiragana_value)
	  	end

	  	def katakana_value
	  		specific_attributes.try(:katakana_value)
	  	end

	  	def value
	  		specific_attributes.try(:value)
	  	end

	  	def concept
	  		specific_attributes.try(:concept)
	  	end

	  	def fr
	  		specific_attributes.try(:fr)
	  	end

		def specific_attributes
			case self.symbole_type
			when "kanji"
				return kanji_attribute
			when "kana"
				return kana_attribute
			else
				return nil
			end
		end
	## accessors ###############


end