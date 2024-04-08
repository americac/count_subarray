def count_subarrays(number_array, k)
  results = 0
  max_number = number_array.max

  while number_array.length.positive?
    max_was_found = 0
    number_array.each do |number|
      next unless number == max_number

      max_was_found += 1
      results += 1 if max_was_found >= k
    end

    number_array.shift
  end

  results
end

result = count_subarrays([1, 3, 2, 3, 3], 2)
message = result == 6 ? 'Sucess' : 'Failed'
puts message

result = count_subarrays([1, 4, 2, 1], 3)
message = result == 0 ? 'Sucess' : 'Failed'
puts message
