# frozen_string_literal: true
require 'test/unit'
extend Test::Unit::Assertions

class String
  def simple_sub(pattern, replace)
    gsub(pattern) { replace }
  end
end

subject = '?? == ??'

assert_equal subject.simple_sub('==', '<='), '?? <= ??'
assert_equal subject.simple_sub('abc', 'def'), '?? == ??'
assert_equal subject.simple_sub('??', 'fun??'), 'fun?? == fun??'

naruse_answer = "Date.parse(date.sub(/(\d+)[-\/](\d\d).(\d{4})/,'\\3-\\1-\\2')).strftime('%b %d, %Y')"
assert_equal subject.simple_sub("??", naruse_answer), "#{naruse_answer} == #{naruse_answer}"
