require 'test/unit'
extend Test::Unit::Assertions

test = ['cat', 'dog', 'fish', 'fish']

def count(array)
  (array.group_by |_| ).map {|k, v| {k => v.length}}.reduce(:merge)
end

assert_equal ({ 'cat' => 1, 'dog' => 1, 'fish' => 2 }), count(test)
