# frozen_string_literal: true
require 'test/unit'
extend Test::Unit::Assertions

def fizzbuzz(x)
  is_mod = -> (val, word, mod) { val % mod == 0 ? word : '' }
  is_mod.call(x, 'Fizz', 3) + is_mod.call(x, 'Buzz', 5)
end

assert_equal fizzbuzz(3), 'Fizz'
assert_equal fizzbuzz(50), 'Buzz'
assert_equal fizzbuzz(15), 'FizzBuzz'
assert_equal fizzbuzz(5175), 'FizzBuzz'

puts [1, 4, nil, 9, 16, nil].compact.reduce(1) { |a, b| a * b }
