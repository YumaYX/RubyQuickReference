require 'csv'

csv= CSV.read("file.csv", headers: true)
csv.headers # => headers
csv.each do |vals_line|
  csv.headers.each do |header|
    p "#{header} => #{vals_line[header]}"
  end
  puts
end
