class Activity < ActiveRecord::Base
	validates :activityname_id, :inclusion => 1..4	

	def self.all_with_epoch
		result = ""
		values = Activity.all

		values.each_with_index do |v, index|
			result += "\"#{Time.local(v.date.year, v.date.month, v.date.day).to_i}\":#{v.activityname_id}"

			if index < values.size - 1
				result += ","
			end
		end

		result
	end
end