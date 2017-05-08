require 'test/unit'
extend Test::Unit::Assertions

class Array
  def interleave(*args)
    self.concat(args.flatten).sort_by(&:to_i)
  end
end

assert_equal [1, 3, 5].interleave(2, 4, 6), [1, 2, 3, 4, 5, 6]
assert_equal [1, 3, 5].interleave([2, 4]), [1, 2, 3, 4, 5]
assert_equal [1, 3, 5].interleave("2", "4"), [1, "2", 3, "4", 5]
assert_equal [].interleave(2, 4, 6), [2, 4, 6]
assert_equal [1, 2, 3].interleave(), [1, 2, 3]
