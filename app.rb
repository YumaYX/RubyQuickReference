#!/usr/bin/env ruby
# frozen_string_literal: true

def puts_plus(str)
  puts str
  puts
end

Dir.chdir('_codes')
rb_scripts_names = Dir.glob('*.rb').map { |element| element.gsub(%r{_codes/}, '') }
heads = rb_scripts_names.map { |element| element.split('_').first }.uniq.sort

puts_plus '# Ruby Quick Reference'
puts_plus '## Official Reference Manual'
puts_plus '- [Link](https://docs.ruby-lang.org/ja/latest/doc/index.html)'
puts_plus '## Contents'

heads.each do |element|
  puts_plus "### #{element.capitalize}"
  puts_plus '<ul>'
  Dir.glob("#{element}*.rb").each do |file|
    puts "<li><a href=\"#{file.gsub(/\.rb$/, '')}.html\">#{file}</a></li>"
  end
  puts_plus '</ul>'
end

puts "Executed with Ruby `#{RUBY_VERSION}`"
