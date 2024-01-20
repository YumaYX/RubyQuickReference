require 'json'

hash = {:key => 'value'}

File.write('file.json', JSON.dump(hash))

#or

File.open('file.json', 'w') {|f| JSON.dump(hash, f)}