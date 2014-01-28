class ScriptOutputter
	attr_accessor :token, :sep

	def initialize(token)
		@token = token.nil? ? "" : token
		@sep = "[\s|\n]*"
	end

	def with(*args) # 可変長引数
		# args = [BasicFunction, Selector]
		args.inject(self) { |acc, val| acc.extend val }
		yield self if block_given?
	end

	def compile
		@token 
	end
end
