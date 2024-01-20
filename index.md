# Ruby Quick Reference


## date.rb

```ruby
t = Time.now
p t.strftime("%F")


require 'date'

p Date::MONTHNAMES
p Date::DAYNAMES
p DOW_JP = %w[日 月 火 水 木 金 土].map(&:freeze).freeze
```

### Result

```

"2024-01-20"
[nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
["日", "月", "火", "水", "木", "金", "土"]
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

## main_block.rb

```ruby
if __FILE__ == $0
  # Code block to be executed only if the script is run directly

  # Add your script's main logic here
end
```

## path.rb

```ruby
puts __dir__

puts __FILE__
```

### Result

```

/Users/yuma/RubyQuickReference/codes
path.rb
```

## read_csv.rb

```ruby
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
```

### Result

```

"key => key1"
"value => value1"

"key => key2"
"value => value2"

"key => key3"
"value => value3"

["key", "key1"]
["value", "value1"]

["key", "key2"]
["value", "value2"]

["key", "key3"]
["value", "value3"]
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

## read_json.rb

```ruby
require 'json'
p JSON.load(File.read('file.json'))
# or
p File.open('file.json') {|j| JSON.load(j)}
```

### Result

```

{"key"=>"value"}
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

## write_json.rb

```ruby
require 'json'

hash = {:key => 'value'}

File.write('file.json', JSON.dump(hash))

#or

File.open('file.json', 'w') {|f| JSON.dump(hash, f)}
```
