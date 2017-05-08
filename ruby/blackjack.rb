# frozen_string_literal: true
require 'test/unit'
extend Test::Unit::Assertions

def twenty_one?(*numbers)
  numbers.reduce(0) { |accu, curr| accu + curr } == 21
end
assert_equal twenty_one?(3, 4, 5, 6, 3), true
assert_equal twenty_one?(3, 11, 10), false
assert_equal twenty_one?(10, 11), true
assert_equal twenty_one?(10, 10), false
