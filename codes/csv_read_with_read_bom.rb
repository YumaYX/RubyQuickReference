require 'csv'
if RUBY_VERSION >= "3.0"
  CSV.read('file.csv', encoding: "BOM|UTF-8", headers: true).map(&:to_h)
else
  CSV.read('file.csv', "r:BOM|UTF-8", headers: true).map(&:to_h)
end