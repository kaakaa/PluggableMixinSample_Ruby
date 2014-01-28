class ModuleLoader
	attr_reader :modules
	
	def initialize(module_base, prefix = 'mod_', extension = 'rb')
		@module_base = module_base
		@modules = []
		@prefix = prefix
		@extension = extension
		Dir.glob(File.join(@module_base, "#{prefix}*.#{extension}")).each do |p|
			require p
			@modules << Object.const_get(to_classname(p))
		end
	end

	private
	def to_classname(str)
		str = str.split('/')[-1]
		str.sub!(/^#{@prefix}(.+)\.#{@extension}/, '\1')
	end
end
