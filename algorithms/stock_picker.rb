def stock_picker(arr)
  buy_price = arr[0]
  sell_price = arr[0]
  profit = sell_price - buy_price
  arr.each_with_index do |price, idx|
    while idx < (arr.length - 1)
      if (arr[idx] - price) > profit
        profit = arr[idx] - price
        buy_price = price
        sell_price = arr[idx]
      end
      idx += 1
    end
  end
  return [buy_price, sell_price, profit]
end

p stock_picker([45, 24, 35, 31, 40, 38, 11])
