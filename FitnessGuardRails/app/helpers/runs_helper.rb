module RunsHelper
	def nl2br(s)
	  s.gsub(/\n/, '<br>')
	end

	def bgcolor_by_participants(participants)
		if participants.include? "Ronny"
			"#FFCEC3"
		elsif participants.include? "Markus"
			"#D8EAFF"
		elsif participants.include? "Tobias"
			"#DAFFC8"
		else
			"#FFFFFF"
		end
	end
end
