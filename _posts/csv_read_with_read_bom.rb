require 'csv'
CSV.read('file.csv', encoding: "BOM|UTF-8", headers: true).map(&:to_h)
