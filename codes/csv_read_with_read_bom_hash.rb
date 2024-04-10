require 'csv'
hash = {}
csv_data = CSV.read('file.csv', encoding: 'BOM|UTF-8', headers: true)
csv_data.each do |row|
  header_key = row.headers.first
  key = row[header_key]
  hash[key] = row.to_h
end
hash
