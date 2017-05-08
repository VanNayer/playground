require 'test/unit'
require 'pry'
extend Test::Unit::Assertions

def random_boolean
  rand(2) == 1
end

array = []

100.times do
  array << :dummy if random_boolean
end
assert_equal (1..100) === array.size, true
assert_equal array.size != 100, true
