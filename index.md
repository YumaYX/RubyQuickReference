# Ruby Quick Reference


## date.rb

```ruby
t = Time.now
p t.strftime("%F")
```

### Result

```
"2024-01-20"
```

## date_daynames.rb

```ruby
require 'date'

p Date::DAYNAMES
```

### Result

```
["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
```

## date_dow.rb

```ruby
require 'date'
p DOW_JP = %w[日 月 火 水 木 金 土].map(&:freeze).freeze
```

### Result

```
["日", "月", "火", "水", "木", "金", "土"]
```

## date_monthnames.rb

```ruby
require 'date'

p Date::MONTHNAMES
```

### Result

```
[nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
```

## file_to_array.rb

```ruby
p File.readlines('file.txt').map(&:chomp)
```

### Result

```
["line1", "line2", "line3"]
```

## heredoc.rb

```ruby
doc = <<~'EOL'
  string
EOL

p doc
```

### Result

```
"string\n"
```

## heredoc_with_value.rb

```ruby
value = 'ruby'
doc = <<~EOL
  #{value}
EOL

p doc
```

### Result

```
"ruby\n"
```

## init_empty_hash.rb

```ruby
hash = Hash.new(0)
hash['key'] += 1
```

## logger_info.rb

```ruby
require 'logger'

logger = Logger.new(STDOUT)

puts "Level INFO"
logger.level = Logger::INFO # <= change level

logger.warn("Nothing to do!") # output
logger.info("Program started") # output
logger.debug("Created logger") # none


# https://docs.ruby-lang.org/ja/latest/library/logger.html
```

### Result

```
Level INFO
W, [2024-01-20T13:33:15.996007 #28049]  WARN -- : Nothing to do!
I, [2024-01-20T13:33:15.996145 #28049]  INFO -- : Program started
```

## logger_warn.rb

```ruby
require 'logger'

logger = Logger.new(STDOUT)

puts "Level WARN"
logger.level = Logger::WARN # <= change level

logger.warn("Nothing to do!") # output
logger.info("Program started") # none
logger.debug("Created logger") # none

# https://docs.ruby-lang.org/ja/latest/library/logger.html
```

### Result

```
Level WARN
W, [2024-01-20T13:33:16.149103 #28066]  WARN -- : Nothing to do!
```

## main_block.rb

```ruby
if __FILE__ == $0
  # Code block to be executed only if the script is run directly

  # Add your script's main logic here
end
```

## path_dir.rb

```ruby
puts __dir__
```

### Result

```
/Users/yuma/RubyQuickReference/codes
```

## path_file.rb

```ruby
puts __FILE__
```

### Result

```
path_file.rb
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

### Result

```
["key", "key1"]
["value", "value1"]

["key", "key2"]
["value", "value2"]

["key", "key3"]
["value", "value3"]
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

### Result

```
"key => key1"
"value => value1"

"key => key2"
"value => value2"

"key => key3"
"value => value3"
```

## read_erb.rb

```ruby
require 'erb'

erb = ERB.new(File.read('file.html.erb'))
@val = 'val'

puts erb.result(binding)
```

### Result

```
<h1>header</h1>

<p>val</p>
```

## read_erb_file_direct.rb

```ruby
require 'erb'

puts ERB.new(File.read('file.html.erb')).result(binding)
```

### Result

```
<h1>header</h1>

<p></p>
```

## read_file.rb

```ruby
p File.read('filewr.txt')
```

### Result

```
"Hello"
```

## read_json_load.rb

```ruby
require 'json'
p JSON.load(File.read('file.json'))
```

### Result

```
{"key"=>"value"}
```

## read_json_open.rb

```ruby
require 'json'
p File.open('file.json') {|j| JSON.load(j)}
```

### Result

```
{"key"=>"value"}
```

## stdin.rb

```ruby
# $stdin.read
```

## write_file.rb

```ruby
File.write('filewr.txt', 'Hello')
```

## write_json_open.rb

```ruby
require 'json'

hash = {:key => 'value'}

File.open('file.json', 'w') {|f| JSON.dump(hash, f)}
```

## write_json_write.rb

```ruby
require 'json'

hash = {:key => 'value'}

File.write('file.json', JSON.dump(hash))
```
