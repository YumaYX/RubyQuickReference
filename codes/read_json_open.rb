require 'json'
p File.open('file.json') {|j| JSON.load(j)}
