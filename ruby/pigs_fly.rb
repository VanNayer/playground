require 'test/unit'
extend Test::Unit::Assertions

def do_pigs_fly?
  return true
  ensure
    return false
end

assert_equal do_pigs_fly?, false
