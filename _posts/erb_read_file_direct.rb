require 'erb'

ERB.new(File.read('file.html.erb')).result(binding)
