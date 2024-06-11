require 'json'
File.open('file.json') {|j| JSON.load(j)}
