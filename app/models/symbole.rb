class Symbole < ActiveRecord::Base

	has_one :hiragana_and_katagana_attribute, :class_name => "HiraganaAndKataganaAttribute", :foreign_key => "symbole_id"
	accepts_nested_attributes_for :hiragana_and_katagana_attribute, :allow_destroy => true
	has_one :kanji_attribute, :class_name => "KanjiAttribute", :foreign_key => "symbole_id"
	accepts_nested_attributes_for :kanji_attribute, :allow_destroy => true
	
	#languages
	scope :jp, -> { where(lang: 'Japanese')}

	#types
	scope :hiraganas_and_kataganas , -> { where(symbole_type: 'hiragana_and_katagana')}
	scope :kanjis , -> { where(symbole_type: 'kanji')}


	validate do
      check_specific_attributes
  	end


	def specific_attributes
		case self.symbole_type
		when "kanji"
			return kanji_attribute
		when "hiragana_and_katagana"
			return hiragana_and_katagana_attribute
		else
			return nil
		end
	end

	def check_specific_attributes
		errors.add(:base, "Informations manquantes") unless specific_attributes.present?
	end
end