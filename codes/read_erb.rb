require 'erb'

erb = ERB.new(File.read('file.html.erb'))
@val = 'val'

erb.result(binding)
