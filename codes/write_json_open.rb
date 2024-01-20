require 'json'

hash = {:key => 'value'}

File.open('file.json', 'w') {|f| JSON.dump(hash, f)}
