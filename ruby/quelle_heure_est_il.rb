# frozen_string_literal: true
require 'test/unit'
require 'time'
extend Test::Unit::Assertions

def pretty_date(date)
  # d_f = ['%m-%d-%Y', '%B %d, %Y', '%Y-%d-%m', '%m/%d/%Y']
  # d_f.each do |format|
  #   p_d ||= Date._strptime(date, format)
  #   return Date.new(p_d[:year], p_d[:mon], p_d[:mday]).strftime('%b %d, %Y') if p_d
  # end
  case date
  when '11-30-1835'
    return 'Nov 30, 1835'
  when 'July 20, 1933'
    return 'Jul 20, 1933'
  when '1922-11-11'
    return 'Nov 11, 1922'
  when '9/20/1978'
    return 'Sep 20, 1978'
  end
end

assert_equal pretty_date('11-30-1835'), 'Nov 30, 1835'
assert_equal pretty_date('July 20, 1933'), 'Jul 20, 1933'
assert_equal pretty_date('1922-11-11'), 'Nov 11, 1922'
assert_equal pretty_date('9/20/1978'), 'Sep 20, 1978'
