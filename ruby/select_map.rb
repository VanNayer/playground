require 'test/unit'
extend Test::Unit::Assertions



assert_equal ["1", 2, "3", 4, "5"].grep(/[1-5]/){ |e| e.succ }, ["2", "4", "6"]
assert_equal [0, 1, 3, 5, 6].grep(1..5, &:succ), [2, 4, 6]
assert_equal ["1", "2", "3", "4", "5"].grep(:true){ |e| e.succ }, ["2", "4", "6"]
assert_equal [1, 2, 3, 4, 5].grep(:true }, &:succ), [2, 4, 6]
