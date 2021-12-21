def stock_picker(day_arr)
  res_arr = []
  start_num = day_arr[0]
  total = 0

  buy_day = 0
  sell_day = 0
  totalProfit = 0

  curr_price = 99_999

  day_arr.each_with_index do |number, index|
    if curr_price < number
      buy_day = index
      sell_day = index
      curr_price = number
    end

    puts "num changed to  #{number}" if new_num_changed
  end
  p res_arr
end
stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
