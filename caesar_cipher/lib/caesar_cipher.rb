# converts a string to ascii
# calls method to shift ascii according to shift
# converts new ascii back to a string

def encode(str, shift = 0)
  ascii = str.bytes
  p str.bytes

  shifted = shift_ascii(ascii, shift)
  p shifted

  encoded = shifted.map(&:chr)
  p encoded

  encoded.reduce('') { |previous, curr| previous + curr }
end

# takes an array of ascii values and shifts them forward shift times
# retains case for uppercase and lowercase
# does not shift symbols

def shift_ascii(ascii_arr, shift = 0)
  ascii_arr.map do |el|
    next el if el < 65 || (el < 97 && el > 90) || el > 122

    bottom_of_range = el >= 97 ? 97 : 65
    (((el - bottom_of_range) + shift) % 26) + bottom_of_range
  end
end
