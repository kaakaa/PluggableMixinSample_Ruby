require File.join(File.dirname(__FILE__), './uwsc_dsl')

# read
str = File.open('input.txt').read

# compile
out = UwscDSL.compile str

# write
File.open('output.txt', 'w') do |f|
	out.each do |e|
		e.split(',').each do |s|
			f.puts s.strip if !s.strip.empty?
		end
	end
end
