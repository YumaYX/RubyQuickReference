#!/usr/bin/env ruby

def puts_plus(str)
  puts str
  puts
end

Dir.chdir('codes')
rb_scripts_names =  Dir.glob("*.rb").map { |element| element.gsub(/codes\//,'') }
heads = rb_scripts_names.map{|element|element.split('_').first}.uniq.sort

puts_plus "# Ruby Quick Reference"
puts_plus "## Contents"

heads.each do |element|
  puts_plus '### '+ element.capitalize
  puts_plus '<ul>'
  Dir.glob(element+'*.rb').each do |file|
    puts "<li><a href=\"#{file.gsub(/\.rb$/,'')}.html\">#{File.basename(file)}</a></li>"
  end
  puts_plus '</ul>'
end
