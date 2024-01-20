require 'json'

hash = {:key => 'value'}

File.write('file.json', JSON.dump(hash))
