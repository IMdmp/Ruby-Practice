# frozen_string_literal: true

def substrings(word, sub_string)
  word.split(' ').each do |word_item|
    puts word_item
  end
  sub_string.each_with_object(Hash.new(0)) do |substring, result|
    word.split(' ').each do |word_item|
      result[substring] += 1 if word_item.include?(substring)
    end
  end
end
dictionary = %w[below down go going horn how howdy it i low own part partner sit]

p substrings('below', dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
