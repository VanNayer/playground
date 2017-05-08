require 'test/unit'
require 'pry'
extend Test::Unit::Assertions

def separate_with_comma(n)
  final = n.to_s.reverse.each_with_object([]) do |current, res|
    res << current
    res << ',' if res.length == 3 || (res.length > 3 && res[res.length-4] == ',')
  end.reverse
  if final.first == ","
    final.delete_at 0
  end
  final.join.to_s
end

puts separate_with_comma(1)
puts separate_with_comma(10)
puts separate_with_comma(100)
puts separate_with_comma(1000)
puts separate_with_comma(10000)
puts separate_with_comma(100000)
puts separate_with_comma(1000000)
