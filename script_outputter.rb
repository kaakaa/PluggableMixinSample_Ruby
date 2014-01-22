class ScriptOutputter
	attr_accessor :token

	def initialize(token)
		@token = token
	end

	def with(*args) # 可変長引数
		# args = [BasicFunction]
		#
		# accの初期値がself
		# argsの要素がiterableにvalに代入される
		args.inject(self) { |acc, val| acc.extend val }
		yield self if block_given?
	end

	def compile
		@token
	end
end

module BasicFunction
	def compile
		# superは親クラスのメソッドcompileの戻り値
		# gsubは破壊的なreplace文
		sep = "[\s|\n]*"
		super.gsub!(/#{sep}\[([^\]]+)\]#{sep}/, 'KBD("\1"), ') if !super.nil?
	end
end
