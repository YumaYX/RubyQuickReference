File.foreach('file_each_line_b.txt') do |line1|
  File.foreach('file_each_line_a.txt') do |line2|
    if line1.eql?(line2)
      puts("MATCHED: #{line1}")
      break
    end
  end
end
