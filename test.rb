toto = [[1, 1, 1], [4, 5, 6], [7, 8, 9]]
toto2 = ["X", "X", nil, 4, 5, 6, 7, 8, 9]

papa = ["X", "X", nil]

# p papa.uniq.join

# p toto2.all?
=begin
toto2.each_slice(3).to_a.any? do |sub|
  puts "sub #{sub}"

  if sub.uniq.join == "X" && sub.none? == 1
    p "ok"
    true
  else
    puts "non"
  end
end
=end

puts "---" * 2
