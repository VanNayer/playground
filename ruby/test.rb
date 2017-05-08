def sum(a, b)
  a + b
end

sum_l = lambda do |a, b|
  a + b
end
puts sum 2, 4
puts sum_l.call 2, 4
puts [2, 3, 4].reduce(&sum_l)
puts [{ a: 1 }, { b: 3 }, { b: 4 }].reduce :merge
puts [[1, 2, 3], [4, 5, 6]].transpose

# yep
class Toto
  puts self
  def initialize
    puts self
    puts Toto
  end
end

Toto.new
