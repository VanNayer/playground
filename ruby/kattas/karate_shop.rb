# frozen_string_literal: true
require 'pry'
require 'test/unit'

class Chop
  def self.chop(to_find, source)
    return -1 if source.to_a.empty? || (to_find > source[-1])
    middle_index = source.length / 2

    if source[middle_index] > to_find
      chop to_find, source[0, middle_index - 1]
    elsif source[middle_index] < to_find
      chop to_find, source[middle_index, source.length - 1]
    end
    middle_index
  end
end

class TestChop < Test::Unit::TestCase
  def test_chop
    assert_equal(-1, Chop.chop(3, []))
    assert_equal(-1, Chop.chop(3, [1]))
    assert_equal(0,  Chop.chop(1, [1]))
    #
    assert_equal(0,  Chop.chop(1, [1, 3, 5]))
    assert_equal(1,  Chop.chop(3, [1, 3, 5]))
    assert_equal(2,  Chop.chop(5, [1, 3, 5]))
    assert_equal(-1, Chop.chop(0, [1, 3, 5]))
    assert_equal(-1, Chop.chop(2, [1, 3, 5]))
    assert_equal(-1, Chop.chop(4, [1, 3, 5]))
    assert_equal(-1, Chop.chop(6, [1, 3, 5]))
    #
    assert_equal(0,  Chop.chop(1, [1, 3, 5, 7]))
    assert_equal(1,  Chop.chop(3, [1, 3, 5, 7]))
    assert_equal(2,  Chop.chop(5, [1, 3, 5, 7]))
    assert_equal(3,  Chop.chop(7, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(0, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(2, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(4, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(6, [1, 3, 5, 7]))
    assert_equal(-1, Chop.chop(8, [1, 3, 5, 7]))
  end
end
