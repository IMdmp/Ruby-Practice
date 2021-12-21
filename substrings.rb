def substrings(word, sub_string)
word.split(" ").each{ |word_item| 
    puts word_item
    }
    sub_string.reduce(Hash.new(0)){  | result, substring | 
        word.split(" ").each{ |word_item| 
            if word_item.include?(substring) then 
                result[substring] +=1
             end 
            
        }
        result
    }          
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] 

p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
