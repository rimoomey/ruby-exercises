#converts a string to ascii
#calls method to shift ascii according to shift
#converts new ascii back to a string
def encode(str, shift=0)
  ascii = str.bytes

  shifted = shift_ascii(ascii, shift)

  encoded = shifted.map { |el| el.chr }

  output = encoded.reduce("") {|previous, curr| previous += curr}
end

#takes an array of ascii values and shifts them forward shift times
#retains case for uppercase and lowercase
#does not shift symbols
def shift_ascii(ascii_arr, shift=0)
  ascii_shifted = ascii_arr.map do |el|

    if el >= 97 && el <= 122
      shifted = (el + shift) % 123
      shifted = shifted + 97 if shifted < 97
      shifted
    elsif el >= 65 && el <= 90
      shifted = (el + shift) % 91
      shifted += 65 if shifted < 65
      shifted
    else
      shifted = el
    end
  end

  ascii_shifted
end

shift = 5
encoded = encode("This,", shift)

decoded = encode(encoded, -shift)

