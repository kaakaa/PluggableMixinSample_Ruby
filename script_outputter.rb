class ScriptOutputter
	attr_accessor :token, :sep

	def initialize(token)
		@token = token.nil? ? "" : token
		@sep = "[\s|\n]*"
	end

	def with(*args) # 可変長引数
		# args = [BasicFunction, Selector]
		args.each do |a|
			p a.class
		end
		args.inject(self) { |acc, val| acc.extend val }
		yield self if block_given?
	end

	def compile
		@token 
	end
end

module BasicFunction
	def compile
		kbd = /\[([^\]]+)\]/
		super.gsub(/#{sep}#{kbd}\+#{kbd}#{sep}/, 'KBD("\1"\,DOWN), KBD("\2"\,CLICK), KBD("\1"\,UP), ').gsub(/#{sep}#{kbd}#{sep}/, 'KBD("\1"), ')
	end
end

module Selector
	def compile
		super.gsub(/#{sep}\*([^\*]+)\*#{sep}/, 'GETID("\1"), ')
	end
end
