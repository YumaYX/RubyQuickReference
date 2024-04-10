require 'csv'
CSV.read('file.csv', 'r:BOM|UTF-8', headers: true).map(&:to_h)