The `<<~EOL` syntax is the heredoc delimiter, and it allows the enclosed text to be treated as a string with preserved whitespace. The `#{value}` within the heredoc is a string interpolation, where the value of the `value` variable is inserted into the string. Therefore, the final content of the `doc` variable would be the string 'ruby'.

If you are using Ruby version 2.3.0 or any later version, you can use this syntax without any issues. If you are using an earlier version, you might encounter a syntax error.
