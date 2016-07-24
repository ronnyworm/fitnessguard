class Run < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true

	def duration_mmss
		duration_mmcolonss.gsub(/:/, '') unless duration_mmcolonss.nil?
	end

	def duration_mmcolonss
		if duration
			if duration >= 3600
				hh = "%02d" % (duration.to_d / 60 / 60)
				mm = "%02d" % ((duration.to_d / 60).to_i % 60)
				ss = "%02d" % (duration.to_i % 60)
				"#{hh}:#{mm}:#{ss}"
			else
				mm = "%02d" % (duration.to_d / 60)
				ss = "%02d" % (duration.to_i % 60)
				"#{mm}:#{ss}"
			end
		end
	end

	def duration_mmss=(mmss)
		if mmss.present?
			begin
				if mmss.length == 6
					self.duration = mmss[0,2].to_i * 60 * 60 + mmss[2,2].to_i * 60  + mmss[4,2].to_i
				elsif mmss.length == 5
					self.duration = mmss[0,1].to_i * 60 * 60 + mmss[1,2].to_i * 60  + mmss[3,2].to_i
				elsif mmss.length == 4
					self.duration = mmss[0,2].to_i * 60 + mmss[2,2].to_i
				else
					self.duration = 0
				end
			rescue
				self.duration = 0
			end
		end
	end

	def km_10
		(km * 10).to_i if km
	end

	def km_10=(km_arg)
		self.km = km_arg.to_d / 10 if km_arg.present?
	end

	def km_rounded
		unless km.nil?
			km.round(1)
		else
			km
		end
	end

	def min_km
		if not duration.nil? and not km.nil?
			min = (duration.to_d / 60) / km
			sec = (min - min.to_i) * 60
			sec = "%02d" % sec.to_i

			"#{min.to_i}:#{sec}"
		else
			""
		end
	end

	def km_h
		if not duration.nil? and not km.nil?
			(km / (duration.to_d / 3600)).round(2)
		else
			""
		end
	end

	def power
		if not duration.nil? and not km.nil?
			((km_h * 5 + km) / 10).round(3)
		else
			""
		end
	end

	def all_participants
		if self.user.nil?
			return participants
		end

		if participants.include? self.user.name
			participants
		else
			participants + " " + self.user.name
		end
	end
end
