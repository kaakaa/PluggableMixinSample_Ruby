require File.join(File.dirname(__FILE__), 'script_outputter')
require File.join(File.dirname(__FILE__), 'module_loader')

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
		ml = ModuleLoader.new(File.join(File.dirname(__FILE__), 'modules'))
		# mixin
		# ScriptOutputter.new(token).with BasicFunction, Selector do |so|
		ScriptOutputter.new(token).with *ml.modules do |so|
			so.compile
		end
	end
end
