#!/usr/bin/env ruby
# frozen_string_literal: true

def puts_plus(str)
  puts str
  puts
end


puts_plus '# Ruby Quick Reference'
puts_plus '## Official Reference Manual'
puts_plus '- [Link](https://docs.ruby-lang.org/ja/latest/doc/index.html)'

Dir.chdir('_codes')
dirs_name = Dir.glob('*').map { |element| element.gsub(%r{_codes/}, '') }

dirs_name.sort.each do |dir_name|
  puts_plus "### #{dir_name.capitalize}"
  puts_plus '<ul>'

  Dir.chdir(dir_name)
  rb_scripts_names = Dir.glob('*.rb')

  rb_scripts_names.each do |file|
    puts "<li><a href=\"#{dir_name}_#{file.gsub(/\.rb$/, '')}.html\">#{file}</a></li>"
  end

  puts_plus '</ul>'
  Dir.chdir("..")
end
