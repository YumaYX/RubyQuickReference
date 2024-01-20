require 'json'
p JSON.load(File.read('file.json'))
# or
p File.open('file.json') {|j| JSON.load(j)}
