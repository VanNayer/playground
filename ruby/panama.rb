require 'test/unit'
extend Test::Unit::Assertions

def longest_palindrome(source)
  find_pal = lambda do |chars_array, even_nb_of_char|
    longest_palindrome = []
    max = 0
    middle = ''

    chars_array.each_with_index do |_char, i|
      i_r = even_nb_of_char ? i + 1 : i
      x_to_left = chars_array.slice(0, i).reverse
      x_to_right = chars_array.slice(i_r, chars_array.length)
      pal = []
      x_to_left.each_with_index do |c, cur|
        break unless x_to_right[cur] == c
        pal << c
        next unless pal.length >= max
        longest_palindrome = pal
        max = pal.length
        middle = chars_array[i] if even_nb_of_char
      end
    end
    [longest_palindrome.reverse.join, middle, longest_palindrome.join].join
  end

  source_array = source.each_char.to_a
  [true, false].map { |look_with_event| find_pal.call(source_array, look_with_event)}.max_by(&:length)
end

assert_equal longest_palindrome('xyzzy'), 'yzzy'
assert_equal longest_palindrome('afbbbfjdjklgdfdhfdkjfffhhfffjkdfhdhkyejejfjkd'), 'dhfdkjfffhhfffjkdfhd'
assert_equal longest_palindrome('bartarcarracecarbartar'), 'racecar'
assert_equal longest_palindrome('3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982'), '46264'
