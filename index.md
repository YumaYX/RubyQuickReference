# Ruby Quick Reference

## Contents

<ul>
<li><a href="#daterb">date.rb</a></li>
<li><a href="#date_daynamesrb">date_daynames.rb</a></li>
<li><a href="#date_dowrb">date_dow.rb</a></li>
<li><a href="#date_monday_of_this_week1rb">date_monday_of_this_week1.rb</a></li>
<li><a href="#date_monday_of_this_week2rb">date_monday_of_this_week2.rb</a></li>
<li><a href="#date_monthnamesrb">date_monthnames.rb</a></li>
<li><a href="#encryption_with_rsarb">encryption_with_rsa.rb</a></li>
<li><a href="#file_to_arrayrb">file_to_array.rb</a></li>
<li><a href="#heredocrb">heredoc.rb</a></li>
<li><a href="#heredoc_with_valuerb">heredoc_with_value.rb</a></li>
<li><a href="#init_empty_hashrb">init_empty_hash.rb</a></li>
<li><a href="#logger_inforb">logger_info.rb</a></li>
<li><a href="#logger_warnrb">logger_warn.rb</a></li>
<li><a href="#main_blockrb">main_block.rb</a></li>
<li><a href="#path_dirrb">path_dir.rb</a></li>
<li><a href="#path_filerb">path_file.rb</a></li>
<li><a href="#read_csv_newrb">read_csv_new.rb</a></li>
<li><a href="#read_csv_readrb">read_csv_read.rb</a></li>
<li><a href="#read_erbrb">read_erb.rb</a></li>
<li><a href="#read_erb_file_directrb">read_erb_file_direct.rb</a></li>
<li><a href="#read_filerb">read_file.rb</a></li>
<li><a href="#read_json_loadrb">read_json_load.rb</a></li>
<li><a href="#read_json_openrb">read_json_open.rb</a></li>
<li><a href="#stdinrb">stdin.rb</a></li>
<li><a href="#write_filerb">write_file.rb</a></li>
<li><a href="#write_json_openrb">write_json_open.rb</a></li>
<li><a href="#write_json_writerb">write_json_write.rb</a></li>
</ul>

---

# date.rb

The overall purpose of the code is to capture the current date and time and then convert it into a string formatted as "YYYY-MM-DD".

```ruby
>> t = Time.now
#=> 2024-01-24 00:13:39.922049 +0900
>> t.strftime("%F")
#=> "2024-01-24"
```

---

# date_daynames.rb

`Date::DAYNAMES` is an array that holds the names of the days of the week in the English language. This constant offers a convenient method for developers to retrieve the names of the days without having to manually define them.

```ruby
>> require 'date'
#=> true
>> Date::DAYNAMES
#=> 
["Sunday",
 "Monday",
 "Tuesday",
 "Wednesday",
 "Thursday",
 "Friday",
 "Saturday"]
```

---

# date_dow.rb

This code defines a constant `DOW_JP` representing the days of the week in Japanese (日曜日, 月曜日, 火曜日, 水曜日, 木曜日, 金曜日, 土曜日).

```ruby
>> DOW_JP = %w[日 月 火 水 木 金 土].map(&:freeze).freeze
#=> 
["日",
...
```

---

# date_monday_of_this_week1.rb

This Ruby snippet utilizes the 'date' library to work with dates. It begins by requiring the library. Then, it obtains the current date and calculates the date for the beginning of the current week (Monday) by subtracting the current day's index from the current date and adding 1. The result is stored in the variable `this_monday`.

```ruby
>> require 'date'
#=> true

>> today = Date.today
#=> #<Date: 2024-01-24 ((2460334j,0s,0n),+0s,2299161j)>
>> this_monday = today - today.wday + 1
#=> #<Date: 2024-01-22 ((2460332j,0s,0n),+0s,2299161j)>
```

---

# date_monday_of_this_week2.rb

This Ruby snippet captures the current date and time, then calculates and assigns the date of the most recent Monday by subtracting the number of seconds corresponding to the days elapsed since the beginning of the week.

```ruby
>> today = Time.now
#=> 2024-01-24 00:13:41.537821 +0900
>> this_monday = today - (today.wday - 1) * 24 * 60 * 60
#=> 2024-01-22 00:13:41.537821 +0900
```

---

# date_monthnames.rb

`Date::MONTHNAMES` is a constant that holds an array of month names.
```ruby
>> require 'date'
#=> true
>> Date::MONTHNAMES
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

---

# encryption_with_rsa.rb

1. **Generate RSA Key Pair:**
   - Import OpenSSL library.
   - Generate a 2048-bit RSA private key.
   - Derive the corresponding public key.

2. **Encrypt Data with RSA:**
   - Use the RSA public key to encrypt the string 'Ruby'.
   - Produce encrypted data (`enc_data`).

3. **Decrypt Data with RSA:**
   - Employ the RSA private key to decrypt the previously encrypted data (`enc_data`).
   - Retrieve the original string ('Ruby').

These snippets showcase RSA key generation, encryption, and decryption using the OpenSSL library in Ruby.

```ruby
>> require 'openssl'
#=> true

>> rsa_private = OpenSSL::PKey::RSA.generate(2048)
#=> #<OpenSSL::PKey::RSA:0x00000001053da800 oid=rsaEncryption>
>> rsa_public = rsa_private.public_key
#=> #<OpenSSL::PKey::RSA:0x0000000104ff73a0 oid=rsaEncryption>

>> secret = 'Ruby'
#=> "Ruby"

>> enc_data = rsa_public.public_encrypt(secret)
#=> "\x9B~rW\x16,\t\x9E6\x99\xA9\xAAs\xC2\xD1\xE58@-\x103?3\a;A\x14\xACiwy\x...

>> rsa_private.private_decrypt(enc_data)
#=> "Ruby"
```

---

# file_to_array.rb

It reads the file, creates an array of lines, and then removes the newline character from each line in the array.

```ruby
>> File.readlines('file.txt').map(&:chomp)
#=> 
["line1",
 "line2",
 "line3"]
```

---

# heredoc.rb

If you are using Ruby version 2.3.0 or any later version, you can use this syntax without any issues. If you are using an earlier version, you might encounter a syntax error.

```ruby
>> doc = <<~'EOL'
'>   string
'> EOL
#=> "string\n"
```

---

# heredoc_with_value.rb

The `<<~EOL` syntax is the heredoc delimiter, and it allows the enclosed text to be treated as a string with preserved whitespace. The `#{value}` within the heredoc is a string interpolation, where the value of the `value` variable is inserted into the string. Therefore, the final content of the `doc` variable would be the string 'ruby'.

If you are using Ruby version 2.3.0 or any later version, you can use this syntax without any issues. If you are using an earlier version, you might encounter a syntax error.

```ruby
>> value = 'ruby'
#=> "ruby"
>> doc = <<~EOL
">   #{value}
"> EOL
#=> "ruby\n"
```

---

# init_empty_hash.rb

This hash is initialized with a default value of 0 for any key that doesn't exist. The next line increments the value associated with the key 'key' by 1. If the key 'key' doesn't exist in the hash, it is created with an initial value of 1. So, this code is effectively counting the occurrences of the 'key' in the hash.

```ruby
>> hash = Hash.new(0)
#=> {}
>> hash['key'] += 1
#=> 1
```

---

# logger_info.rb

Ref. <https://docs.ruby-lang.org/ja/latest/library/logger.html>

```ruby
>> require 'logger'
#=> true

>> logger = Logger.new(STDOUT)
#=> 
#<Logger:0x00000001023794e0
...

>> puts "Level INFO"
Level INFO
#=> nil
>> logger.level = Logger::INFO # <= change level
#=> 1

>> logger.warn("Nothing to do!") # output
W, [2024-01-24T00:13:44.473163 #6495]  WARN -- : Nothing to do!
#=> true
>> logger.info("Program started") # output
I, [2024-01-24T00:13:44.473634 #6495]  INFO -- : Program started
#=> true
>> logger.debug("Created logger") # none
#=> true
```

---

# logger_warn.rb

Ref. <https://docs.ruby-lang.org/ja/latest/library/logger.html>

```ruby
>> require 'logger'
#=> true

>> logger = Logger.new(STDOUT)
#=> 
#<Logger:0x0000000107c79720
...

>> puts "Level WARN"
Level WARN
#=> nil
>> logger.level = Logger::WARN # <= change level
#=> 2

>> logger.warn("Nothing to do!") # output
W, [2024-01-24T00:13:44.884025 #6516]  WARN -- : Nothing to do!
#=> true
>> logger.info("Program started") # none
#=> true
>> logger.debug("Created logger") # none
#=> true
```

---

# main_block.rb

This Ruby code checks whether the current file is being executed directly (as opposed to being required as a module in another file) and performs actions specified within the `if` block when true.

```ruby
>> if __FILE__ == $0
?>     # Code block to be executed only if the script is run directly
?>   
?>     # Add your script's main logic here
?>   end
#=> nil
```

---

# path_dir.rb

`__dir__` is a built-in method in Ruby that returns the absolute path of the directory containing the source file in which it is called. It provides a convenient way to reference the current script's directory.

```ruby
>> __dir__
#=> "."
```

---

# path_file.rb

`__FILE__` in Ruby is a predefined constant that represents the current file's name. It returns a string with the name of the file in which it is used.

```ruby
>> __FILE__
#=> "path_file.rb"
```

---

# read_csv_new.rb

This Ruby code reads a CSV file named "file.csv" and prints each row as an array of header-value pairs. It utilizes the CSV library to handle the parsing of the CSV file and iterates through each row, printing the header and corresponding value for each column in that row.

```ruby
>> require 'csv'
#=> true

>> File.open("file.csv", "r") do |f|
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

---

# read_csv_read.rb

This Ruby code uses the CSV library to read data from a CSV file. It reads the file with headers, iterates through each row, and prints each header-value pair for every row in a human-readable format.

```ruby
>> require 'csv'
#=> true

>> csv= CSV.read("file.csv", headers: true)
#=> 
#<CSV::Table mode:col_or_row row_count:4>
...
>> csv.headers # => headers
#=> 
["key",
 "value"]
>> csv.each do |vals_line|
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

---

# read_erb.rb

This Ruby code uses the ERB (Embedded RuBy) library to process an ERB template stored in a file named 'file.html.erb.' It creates an ERB object, reads the template file, and sets a variable '@val' to the value 'val.' Finally, it evaluates the ERB template with the current binding, and the result is returned.

```ruby
>> require 'erb'
#=> true

>> erb = ERB.new(File.read('file.html.erb'))
#=> 
#<ERB:0x00000001042412d8
...
>> @val = 'val'
#=> "val"

>> erb.result(binding)
#=> "<h1>header</h1>\n\n<p>val</p>\n"
```

---

# read_erb_file_direct.rb

This Ruby code snippet utilizes the Embedded Ruby (ERB) library to process and evaluate the content of an ERB template file ('file.html.erb'). It reads the file, interprets embedded Ruby code within it, and produces the final result by applying the specified binding.

```ruby
>> require 'erb'
#=> true

>> ERB.new(File.read('file.html.erb')).result(binding)
#=> "<h1>header</h1>\n\n<p></p>\n"
```

---

# read_file.rb

This Ruby code uses the `File.read` method to read the contents of a file named 'filewr.txt' and returns the content as a string.

```ruby
>> File.read('filewr.txt')
#=> "Hello"
```

---

# read_json_load.rb

This Ruby code snippet uses the 'json' library to load and parse data from a JSON file named 'file.json'. The 'require' statement is used to include the necessary JSON library, and 'JSON.load' is then employed to read and convert the contents of the JSON file into a Ruby data structure.

```ruby
>> require 'json'
#=> true
>> JSON.load(File.read('file.json'))
#=> 
{"key"=>
  "value"}
```

---

# read_json_open.rb

This Ruby code uses the 'json' library to read and parse a JSON file named 'file.json'. It opens the file and uses the JSON.load method to load and parse the content, returning a Ruby data structure representing the JSON data.

```ruby
>> require 'json'
#=> true
>> File.open('file.json') {|j| JSON.load(j)}
#=> 
{"key"=>
  "value"}
```

---

# stdin.rb

The line of Ruby code `$stdin.read` reads input from the standard input (keyboard) until the end of the file (EOF) is reached, and stores the input as a string.

```ruby
>> # $stdin.read
#=> nil
```

---

# write_file.rb

This Ruby code snippet uses the `File.write` method to create a file named 'filewr.txt' and write the text 'Hello' into it.

```ruby
>> File.write('filewr.txt', 'Hello')
#=> 5
```

---

# write_json_open.rb

This Ruby code uses the 'json' library to convert a hash (key-value pair) into a JSON format and then writes it to a file named 'file.json'. The hash contains a single key-value pair, where the key is ":key" and the value is "'value'". The File.open block ensures the JSON representation of the hash is dumped into the specified file in write ('w') mode.

```ruby
>> require 'json'
#=> true

>> hash = {:key => 'value'}
#=> 
{:key=>
...

>> File.open('file.json', 'w') {|f| JSON.dump(hash, f)}
#=> #<File:file.json (closed)>
```

---

# write_json_write.rb

This Ruby code snippet uses the 'json' library to work with JSON data. It creates a hash with a key-value pair and then writes the hash as a JSON-formatted string to a file named 'file.json'.

```ruby
>> require 'json'
#=> true

>> hash = {:key => 'value'}
#=> 
{:key=>
...

>> File.write('file.json', JSON.dump(hash))
#=> 15
```

