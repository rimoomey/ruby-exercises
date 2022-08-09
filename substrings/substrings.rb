dictionary = ["below","down","go","going","horn","how","howdy", "it","i","low","own","part","partner","sit"]

#returns an array of substrings separated by " " with all special characters
#removed and in lowercase
def separate(string)
  strings_no_specials = string.gsub(/[^A-Za-z ]/, '')
  strings_no_specials = strings_no_specials.downcase

  array_strings = strings_no_specials.split(" ")
end

#takes an array to search and a dictionary array to search by
#returns a hash that contains the count of each dictionary element 
#found in search_string
def substrings(search_string, dictionary)

  array_string = separate(search_string)

  hit = dictionary.reduce({}) do |previous, curr|

    puts curr
    if array_string.count(curr) > 0
      previous[curr] = array_string.count(curr)
    end
  previous
  end
end



p substrings("below, down go!", dictionary)
p substrings("Let's have a party, partner! Sit down, buddy! Howdy!", dictionary)
