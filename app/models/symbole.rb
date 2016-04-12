class Symbole < ActiveRecord::Base

	has_one :kana_attribute, :class_name => "KanaAttribute", :foreign_key => "symbole_id"
	accepts_nested_attributes_for :kana_attribute, :allow_destroy => true
	has_one :kanji_attribute, :class_name => "KanjiAttribute", :foreign_key => "symbole_id"
	accepts_nested_attributes_for :kanji_attribute, :allow_destroy => true
	
	#languages
	scope :jp, -> { where(lang: 'Japonais')}

	#types
	scope :kanas , -> { where(symbole_type: 'kana')}
	scope :kanjis , -> { where(symbole_type: 'kanji')}


	validate do
      check_specific_attributes
  	end

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

	def check_specific_attributes
		errors.add(:base, "Informations manquantes") unless specific_attributes.present?
	end
end