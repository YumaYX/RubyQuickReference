File.foreach('foreach_b.txt') do |line1|
  File.foreach('foreach_a.txt') do |line2|
    if line1.eql?(line2)
      puts("MATCHED: #{line1}")
      break
    end
  end
end
