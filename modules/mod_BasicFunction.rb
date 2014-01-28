module BasicFunction
	def compile
		kbd = /\[([^\]]+)\]/
		super.gsub(/#{sep}#{kbd}\+#{kbd}#{sep}/, 'KBD("\1"\,DOWN), KBD("\2"\,CLICK), KBD("\1"\,UP), ').gsub(/#{sep}#{kbd}#{sep}/, 'KBD("\1"), ')
	end
end
