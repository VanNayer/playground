require 'test/unit'
extend Test::Unit::Assertions
# -*- coding: utf-8 -*-
self.encode!('UTF-8')
truc = "U*"
puts " => #{[0, 1].pack(truc)}"
puts " => #{[0x7f].pack(truc)}"
puts " => #{[0x80].pack(truc)}"
puts " => #{"\u3042".unpack(truc)}"
puts " => #{"あいうえお".unpack(truc)}"
puts " => #{[12354, 12356, 12358, 12360, 12362].pack(truc)}"

assert_equal [0, 1].pack('s'), "\000\001"
assert_equal [0x7f].pack(___), "\177"
assert_equal [0x80].pack(___), "\302\200"
assert_equal "\u3042".unpack(___), [0x3042]
assert_equal "あいうえお".unpack(___), [12354, 12356, 12358, 12360, 12362]
assert_equal [12354, 12356, 12358, 12360, 12362].pack(___), "あいうえお"
