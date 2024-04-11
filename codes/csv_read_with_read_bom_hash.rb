require 'csv'
hash = {}

csv_data = if RUBY_VERSION >= "3.0"
  CSV.read('file.csv', encoding: "BOM|UTF-8", headers: true)
else
  CSV.read('file.csv', "r:BOM|UTF-8", headers: true)
end

csv_data.each do |row|
  header_key = row.headers.first
  key = row[header_key]
  hash[key] = row.to_h
end

hash
