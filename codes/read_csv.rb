# CSV.readを使う場合
require 'csv'
csv= CSV.read("file.csv", headers: true)
csv.headers # => headers
csv.each do |vals_line|
  csv.headers.each do |header|
    p "#{header} => #{vals_line[header]}"
  end
  puts
end

# or

File.open("file.csv", "r") do |f|
  csv = CSV.new(f, headers: true)
  csv.each do |line|
    line.each do |header, val|
      p [header, val]
    end
    puts
  end
end