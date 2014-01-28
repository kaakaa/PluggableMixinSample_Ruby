module Selector
	def compile
		super.gsub(/#{sep}\*([^\*]+)\*#{sep}/, 'GETID("\1"), ')
	end
end
