class Run < ActiveRecord::Base


	def duration_mmss
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
end
