class StartingPoint < ActiveRecord::Base
	has_many :track
	belongs_to :region

	def self.getAllNames
		result = all.map do |c|
			"#{c.region.name} - #{c.name}" 
		end

		return result
	end
end
