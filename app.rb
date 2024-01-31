#!/usr/bin/env ruby

Dir.chdir('codes')
rb_scripts_names =  Dir.glob("*.rb").map { |element| element.gsub(/codes\//,'') }
heads = rb_scripts_names.map{|element|element.split('_').first}.uniq.sort

puts "# Ruby Quick Reference"
puts

puts "## Contents"
puts


heads.each do |element|
  puts '### '+ element.capitalize
  puts
  puts '<ul>'
  Dir.glob(element+'*.rb').each do |file|
    puts "<li><a href=\"#{file.gsub(/\.rb$/,'')}.html\">#{File.basename(file)}</a></li>"
  end
  puts '</ul>'
  puts
end
