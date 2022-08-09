prices = [17,3,6,9,15,8,6,1,10]

#takes array of prices
#compares the current index to all following indices
#returns an array containing the best day to buy and sell
def stock_picker(price_array)

  maximum = 0
  best_days = []
  price_array.each_with_index do |day, index1|
    for index2 in index1...(price_array.length - 1) do

      if (price_array[index2] - day) > maximum
        maximum = price_array[index2] - day
        best_days = [index1, index2]
      end
    end
  end

  best_days
end

p stock_picker(prices)
    