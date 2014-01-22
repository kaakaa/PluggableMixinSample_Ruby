require File.join(File.dirname(__FILE__), 'script_outputter')

class UwscDSL
	class << self
		def compile(str)
			UwscDSL.new.interpret(str)
		end
	end
	
	def interpret(str)
		scripts = []
		str.split(' ').each do |token|
			scripts << parse(token)
		end
		scripts
	end

	def parse(token)
		# mixin
		ScriptOutputter.new(token).with BasicFunction do |so|
			so.compile
		end
	end
end
