# frozen_string_literal: true
require 'test/unit'
extend Test::Unit::Assertions

class HashWithIndifferentAccess
  def initialize(hash = {})
    @hash = hash
  end

  def self.[](*args)
    new Hash[*args.map(&:to_s)]
  end

  def [](key)
    @hash[key.to_s]
  end

  def []=(k, v)
    @hash[k.to_s] = v.to_s
  end
end

composers = HashWithIndifferentAccess.new
composers[:Janacek] = 'Leos Janacek'
composers['Sweelinck'] = 'Jan Pieterszoon Sweelinck'

mathematicians = HashWithIndifferentAccess['Yutaka', 'Taniyama', :Alonzo, 'Church']

assert_equal composers['Janacek'], 'Leos Janacek'
assert_equal composers[:Sweelinck], 'Jan Pieterszoon Sweelinck'
assert_equal mathematicians[:Yutaka], 'Taniyama'
assert_equal (mathematicians['Alonzo'] == mathematicians[:Alonzo]), true
