class KanjiAttribute < ActiveRecord::Base
	belongs_to :symboles
	validates :value, :concept, :fr, :presence => true
end
