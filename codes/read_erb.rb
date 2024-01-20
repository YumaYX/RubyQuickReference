require 'erb'

erb = ERB.new(File.read('file.html.erb'))
@val = 'val'

puts erb.result(binding)
