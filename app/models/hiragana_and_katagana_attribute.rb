class HiraganaAndKataganaAttribute < ActiveRecord::Base
	belongs_to :symboles
	validates :hirahana_value, :katagana_value, :fr, :presence => true
end
