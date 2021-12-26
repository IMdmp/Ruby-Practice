def caesar_cipher(message, shiftFactor)
  res_string = ''
  upp_case_arr = []
  low_case_arr = []

  ('A'..'Z').each do |x|
    upp_case_arr.push(x)
  end
  ('a'..'z').each do |x|
    low_case_arr.push(x)
  end

  message.each_char do |x|
    res_string += if upp_case_arr.include?(x)
                    upp_case_arr[(upp_case_arr.find_index(x) + shiftFactor) % 26]
                  elsif low_case_arr.include?(x)
                    low_case_arr[(low_case_arr.find_index(x) + shiftFactor) % 26]
                  else
                    x
                  end
  end

  # p(upp_case_arr)
  # p(low_case_arr)

  # p(upp_case_arr[4])
  p res_string
end

caesar_cipher('What w string!', 5)
