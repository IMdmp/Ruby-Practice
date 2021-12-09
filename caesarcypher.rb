def caesar_cipher(message,shiftFactor)
    res_string = ""
    upp_case_arr = Array.new
    low_case_arr = Array.new

    for x in  ('A'..'Z')
        upp_case_arr.push(x)
    end 

    for x in ('a' .. 'z')
        low_case_arr.push(x)
    end 

    message.each_char do |x| 
        if upp_case_arr.include?(x) 
            res_string += upp_case_arr[(upp_case_arr.find_index(x) + shiftFactor) % 25]
        elsif (low_case_arr.include?(x))
            res_string += low_case_arr[(low_case_arr.find_index(x) + shiftFactor) % 25]
        else
            res_string += x
        end 
    end

    # p(upp_case_arr)
    # p(low_case_arr)
    
    # p(upp_case_arr[4])
    p res_string

end


caesar_cipher("What a string!",5)

