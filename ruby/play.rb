require "test/unit/assertions"
include Test::Unit::Assertions

def validate_hello(greetings)
  greetings.downcase.match(/hello|ciao|salut|hallo|hola|ahoj|czesc/) != nil
end



assert_equal(validate_hello('hello'), true)
assert_equal(validate_hello('ciao bella!'), true)
assert_equal(validate_hello('salut'), true)
assert_equal(validate_hello('hallo, salut'), true)
assert_equal(validate_hello('hombre! Hola!'), true)
assert_equal(validate_hello('Hallo, wie geht\'s dir?'), true)
assert_equal(validate_hello('AHOJ!'), true)
assert_equal(validate_hello('czesc'), true)
assert_equal(validate_hello('meh'), false)
assert_equal(validate_hello('Ahoj'), true)
