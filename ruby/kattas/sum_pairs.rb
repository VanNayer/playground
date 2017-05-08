# frozen_string_literal: true
require 'minitest/autorun'
# FIRST
# def sum_pairs(ints, s)
#   solutions = {}
#    ints.each_with_index do |val_1, i|
#      ints[i+1..ints.length-1].each_with_index do |val_2, j|
#        solutions[i+j] = [val_1, val_2] if val_1 + val_2 == s
#      end
#    end
#    return nil if solutions.empty?
#    solutions.sort.first[1]
# end

# SECOND
# def sum_pairs(ints, s)
#    (1..ints.length-1).each do |distance|
#     ints.each_with_index do |val_1, index_left|
#       puts "Avec #{val_1} et la distance #{index_left}"
#       if index_left + distance < ints.length
#         val_2 = ints[index_left + distance]
#         return [val_1, val_2] if val_1 + val_2 == s
#       end
#     end
#   end
#   return nil
# end

# THIRD
# def sum_pairs(ints, s)
#   (1..ints.length-1).each do |distance|
#     ints[0..ints.length-distance-1].each_with_index do |val_1, index_left|
#       val_2 = ints[index_left + distance]
#       return [val_1, val_2] if val_1 + val_2 == s
#     end
#   end
#   return nil
# end

# FORTH
# def sum_pairs(ints, s)
#   ints_and_minimal_index = {}
#   ints.each_with_index { |int, index| ints_and_minimal_index[int] = ints_and_minimal_index[int].nil? ?
# [index] : ints_and_minimal_index[int] << index }
#
#   solution = nil
#   distance_max = ints.length
#   ints_and_minimal_index.select do |int, index|
#
#     if ints_and_minimal_index[s - int]
#       distance_min = ints.length
#       index.each do |left|
#         ints_and_minimal_index[s - int].each do |right|
#           distance = right - left
#           distance_min = distance if distance > 0 && distance < distance_min
#         end
#       end
#       if distance_min > 0 && distance_min < distance_max
#         distance_max = distance_min
#         solution = [int, s - int]
#       end
#     end
#   end
#   solution
# end

def sum_pairs(ints, s)
  viewed = {}
  ints.each do |int|
    return [s - int, int] if viewed[s - int]
    viewed[int] = true
  end
  nil
end

class PlayGroundTest < Minitest::Test
  def test_1
    l_1 = [1, 4, 8, 7, 3, 15]
    l_2 = [1, -2, 3, 0, -6, 1]
    l_3 = [20, -13, 40]
    l_4 = [1, 2, 3, 4, 1, 0]
    l_5 = [10, 5, 2, 3, 7, 5]
    l_6 = [4, -2, 3, 3, 4]
    l_7 = [0, 2, 0]
    l_8 = [5, 9, 13, -3]

    assert_equal [1, 7], sum_pairs(l_1, 8)
    assert_equal [0, -6], sum_pairs(l_2, -6)
    assert_equal nil, sum_pairs(l_3, -7)
    assert_equal [1, 1], sum_pairs(l_4, 2)
    assert_equal [3, 7], sum_pairs(l_5, 10)
    assert_equal [4, 4], sum_pairs(l_6, 8)
    assert_equal [0, 0], sum_pairs(l_7, 0)
    assert_equal [13, -3], sum_pairs(l_8, 10)
  end
end
