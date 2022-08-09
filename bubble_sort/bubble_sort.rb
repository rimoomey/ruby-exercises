array = [4,3,78,0]

#bubble sort implementation for an array of numbers
def bubble_sort(array_numbers)

  return array_numbers if array_numbers.length < 1 

  swap_counter = 1

  until swap_counter == 0
    swap_counter = 0

    for index in 0...(array_numbers.length - 1) do

      if array_numbers[index] > array_numbers[index + 1]

        swap_counter+=1
        temp = array_numbers[index + 1]
        array_numbers[index + 1] = array_numbers[index]
        array_numbers[index] = temp
      end
    end
  end
  array_numbers
end

p bubble_sort(array)