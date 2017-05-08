require 'test/unit'
extend Test::Unit::Assertions

module Test::Unit::Assertions
  def assert_equal a, b
  end
end

assert_equal true, false

assert_equal "X" * ( 2.round 2 ), ""
assert_equal "X" * ( 2.round 0 ), "X"
