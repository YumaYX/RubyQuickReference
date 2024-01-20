require 'erb'

puts ERB.new(File.read('file.html.erb')).result(binding)