class Run < ActiveRecord::Base


	def duration_mmss
		duration_mmcolonss.gsub(/:/, '') unless duration_mmcolonss.nil?
	end

	def duration_mmcolonss
		if duration
			mm = "%02d" % (duration.to_d / 60)
			ss = "%02d" % (duration.to_i % 60)
			"#{mm}:#{ss}"
		end
	end

	def duration_mmss=(mmss)
		if mmss.present?
			begin
				self.duration = mmss[0,2].to_i * 60 + mmss[2,4].to_i
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
		km.round(1)
	end

	def min_km
		min = (duration.to_d / 60) / km
		sec = (min - min.to_i) * 60
		sec = "%02d" % sec.to_i

		"#{min.to_i}:#{sec}"
	end

	def km_h
		(km / (duration.to_d / 3600)).round(2)
	end

	def power
		((km_h * 5 + km) / 10).round(3)
	end
end
