# Ruby Quick Reference

## date.rb

The overall purpose of the code is to capture the current date and time and then convert it into a string formatted as "YYYY-MM-DD".

```ruby
t = Time.now
t.strftime("%F")
```

```
t = Time.now
#=> 2024-01-21 10:06:01.05369 +0900
t.strftime("%F")
#=> "2024-01-21"
```

## date_daynames.rb

`Date::DAYNAMES` is an array that holds the names of the days of the week in the English language. This constant offers a convenient method for developers to retrieve the names of the days without having to manually define them.

```ruby
require 'date'
Date::DAYNAMES
```

```
require 'date'
#=> true
Date::DAYNAMES
#=> 
["Sunday",
 "Monday",
 "Tuesday",
 "Wednesday",
 "Thursday",
 "Friday",
 "Saturday"]
```

## date_dow.rb

```ruby
DOW_JP = %w[日 月 火 水 木 金 土].map(&:freeze).freeze
```

```
DOW_JP = %w[日 月 火 水 木 金 土].map(&:freeze).freeze
#=> 
["日",
...
```

## date_monthnames.rb

`Date::MONTHNAMES` is a constant that holds an array of month names.
```ruby
require 'date'
Date::MONTHNAMES
```

```
require 'date'
#=> true
Date::MONTHNAMES
#=> 
[nil,
 "January",
 "February",
 "March",
 "April",
 "May",
 "June",
 "July",
 "August",
 "September",
 "October",
 "November",
 "December"]
```

## file_to_array.rb

It reads the file, creates an array of lines, and then removes the newline character from each line in the array.

```ruby
File.readlines('file.txt').map(&:chomp)
```

```
File.readlines('file.txt').map(&:chomp)
#=> 
["line1",
 "line2",
 "line3"]
```

## heredoc.rb

If you are using Ruby version 2.3.0 or any later version, you can use this syntax without any issues. If you are using an earlier version, you might encounter a syntax error.

```ruby
doc = <<~'EOL'
  string
EOL
```

```
doc = <<~'EOL'
'>   string
'> EOL
#=> "string\n"
```

## heredoc_with_value.rb

The `<<~EOL` syntax is the heredoc delimiter, and it allows the enclosed text to be treated as a string with preserved whitespace. The `#{value}` within the heredoc is a string interpolation, where the value of the `value` variable is inserted into the string. Therefore, the final content of the `doc` variable would be the string 'ruby'.

If you are using Ruby version 2.3.0 or any later version, you can use this syntax without any issues. If you are using an earlier version, you might encounter a syntax error.

```ruby
value = 'ruby'
doc = <<~EOL
  #{value}
EOL
```

```
value = 'ruby'
#=> "ruby"
doc = <<~EOL
">   #{value}
"> EOL
#=> "ruby\n"
```

## init_empty_hash.rb

This hash is initialized with a default value of 0 for any key that doesn't exist. The next line increments the value associated with the key 'key' by 1. If the key 'key' doesn't exist in the hash, it is created with an initial value of 1. So, this code is effectively counting the occurrences of the 'key' in the hash.

```ruby
hash = Hash.new(0)
hash['key'] += 1
```

```
hash = Hash.new(0)
#=> {}
hash['key'] += 1
#=> 1
```

## logger_info.rb

Ref. <https://docs.ruby-lang.org/ja/latest/library/logger.html>

```ruby
require 'logger'

logger = Logger.new(STDOUT)

puts "Level INFO"
logger.level = Logger::INFO # <= change level

logger.warn("Nothing to do!") # output
logger.info("Program started") # output
logger.debug("Created logger") # none
```

```
require 'logger'
#=> true

logger = Logger.new(STDOUT)
#=> 
#<Logger:0x00000001006e8d58
...

puts "Level INFO"
Level INFO
#=> nil
logger.level = Logger::INFO # <= change level
#=> 1

logger.warn("Nothing to do!") # output
W, [2024-01-21T10:06:03.711995 #79006]  WARN -- : Nothing to do!
#=> true
logger.info("Program started") # output
I, [2024-01-21T10:06:03.712361 #79006]  INFO -- : Program started
#=> true
logger.debug("Created logger") # none
#=> true
```

## logger_warn.rb

Ref. <https://docs.ruby-lang.org/ja/latest/library/logger.html>

```ruby
require 'logger'

logger = Logger.new(STDOUT)

puts "Level WARN"
logger.level = Logger::WARN # <= change level

logger.warn("Nothing to do!") # output
logger.info("Program started") # none
logger.debug("Created logger") # none
```

```
require 'logger'
#=> true

logger = Logger.new(STDOUT)
#=> 
#<Logger:0x00000001098a8ce8
...

puts "Level WARN"
Level WARN
#=> nil
logger.level = Logger::WARN # <= change level
#=> 2

logger.warn("Nothing to do!") # output
W, [2024-01-21T10:06:04.041562 #79028]  WARN -- : Nothing to do!
#=> true
logger.info("Program started") # none
#=> true
logger.debug("Created logger") # none
#=> true
```

## main_block.rb

```ruby
if __FILE__ == $0
  # Code block to be executed only if the script is run directly

  # Add your script's main logic here
end
```

```
if __FILE__ == $0
?>     # Code block to be executed only if the script is run directly
?>   
?>     # Add your script's main logic here
?>   end
#=> nil
```

## path_dir.rb

```ruby
__dir__
```

```
__dir__
#=> "."
```

## path_file.rb

```ruby
__FILE__
```

```
__FILE__
#=> "path_file.rb"
```

## read_csv_new.rb

```ruby
require 'csv'

File.open("file.csv", "r") do |f|
  csv = CSV.new(f, headers: true)
  csv.each do |line|
    line.each do |header, val|
      p [header, val]
    end
    puts
  end
end
```

```
require 'csv'
#=> true

File.open("file.csv", "r") do |f|
?>     csv = CSV.new(f, headers: true)
?>     csv.each do |line|
?>         line.each do |header, val|
?>             p [header, val]
?>           end
?>         puts
?>       end
?>   end
["key", "key1"]
["value", "value1"]

["key", "key2"]
["value", "value2"]

["key", "key3"]
["value", "value3"]

#=> nil
```

## read_csv_read.rb

```ruby
require 'csv'

csv= CSV.read("file.csv", headers: true)
csv.headers # => headers
csv.each do |vals_line|
  csv.headers.each do |header|
    p "#{header} => #{vals_line[header]}"
  end
  puts
end
```

```
require 'csv'
#=> true

csv= CSV.read("file.csv", headers: true)
#=> 
#<CSV::Table mode:col_or_row row_count:4>
...
csv.headers # => headers
#=> 
["key",
 "value"]
csv.each do |vals_line|
?>     csv.headers.each do |header|
?>         p "#{header} => #{vals_line[header]}"
?>       end
?>     puts
?>   end
"key => key1"
"value => value1"

"key => key2"
"value => value2"

"key => key3"
"value => value3"

#=> 
#<CSV::Table mode:col_or_row row_count:4>
key,value
key1,value1
key2,value2
key3,value3
```

## read_erb.rb

```ruby
require 'erb'

erb = ERB.new(File.read('file.html.erb'))
@val = 'val'

erb.result(binding)
```

```
require 'erb'
#=> true

erb = ERB.new(File.read('file.html.erb'))
#=> 
#<ERB:0x000000010baff3c8
...
@val = 'val'
#=> "val"

erb.result(binding)
#=> "<h1>header</h1>\n\n<p>val</p>\n"
```

## read_erb_file_direct.rb

```ruby
require 'erb'

ERB.new(File.read('file.html.erb')).result(binding)
```

```
require 'erb'
#=> true

ERB.new(File.read('file.html.erb')).result(binding)
#=> "<h1>header</h1>\n\n<p></p>\n"
```

## read_file.rb

```ruby
File.read('filewr.txt')
```

```
File.read('filewr.txt')
#=> "Hello"
```

## read_json_load.rb

```ruby
require 'json'
JSON.load(File.read('file.json'))
```

```
require 'json'
#=> true
JSON.load(File.read('file.json'))
#=> 
{"key"=>
  "value"}
```

## read_json_open.rb

```ruby
require 'json'
File.open('file.json') {|j| JSON.load(j)}
```

```
require 'json'
#=> true
File.open('file.json') {|j| JSON.load(j)}
#=> 
{"key"=>
  "value"}
```

## stdin.rb

```ruby
# $stdin.read
```

```
# $stdin.read
#=> nil
```

## write_file.rb

```ruby
File.write('filewr.txt', 'Hello')
```

```
File.write('filewr.txt', 'Hello')
#=> 5
```

## write_json_open.rb

```ruby
require 'json'

hash = {:key => 'value'}

File.open('file.json', 'w') {|f| JSON.dump(hash, f)}
```

```
require 'json'
#=> true

hash = {:key => 'value'}
#=> 
{:key=>
...

File.open('file.json', 'w') {|f| JSON.dump(hash, f)}
#=> #<File:file.json (closed)>
```

## write_json_write.rb

```ruby
require 'json'

hash = {:key => 'value'}

File.write('file.json', JSON.dump(hash))
```

```
require 'json'
#=> true

hash = {:key => 'value'}
#=> 
{:key=>
...

File.write('file.json', JSON.dump(hash))
#=> 15
```

