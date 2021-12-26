# frozen_string_literal: true

def stock_picker(prices, buy_price = prices[0],buy_day = 0,profit = 0)
  days_max_profit = [0, 0]

  prices.each_with_index do |price, day|
    if price < buy_price
      buy_price = price
      buy_day = day
      next
    end

    if price - buy_price > profit
      profit = price - buy_price
      days_max_profit = [buy_day, day]
    end
  end

  days_max_profit
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
