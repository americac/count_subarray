def count_subarrays(number_array, k)
  found_sub_set = 0
  max_number = number_array.max
  new_array = number_array
  left_index = 0

  while new_array.size >= k
    max_was_found = 0
    new_array.each do |number|
      next unless number == max_number

      max_was_found += 1
    end

    found_sub_set += 1 if max_was_found >= k

    new_array = number_array.slice(left_index += 1, number_array.size)

    next unless new_array.size < k

    number_array.pop
    left_index = 0
    new_array = number_array.slice(left_index, number_array.size)
  end

  found_sub_set
end

result = count_subarrays([1, 3, 2, 3, 3], 2)
message = result == 6 ? 'Passed' : 'Failed'
puts message

result = count_subarrays([1, 4, 2, 1], 3)
message = result.zero? ? 'Passed' : 'Failed'
puts message

result = count_subarrays(
  [61, 23, 38, 23, 56, 40, 82, 56, 82, 82, 82, 70, 8, 69, 8, 7, 19, 14, 58, 42, 82, 10, 82, 78, 15, 82], 2
)
message = result == 224 ? 'Passed' : 'Failed'
puts message

result = count_subarrays([4, 4, 4, 1, 2], 2)
message = result == 7 ? 'Passed' : 'Failed'
puts message

result = count_subarrays([37, 20, 38, 66, 34, 38, 9, 41, 1, 14, 25, 63, 8, 12, 66, 66, 60, 12, 35, 27, 16, 38, 12, 66,
                          38, 36, 59, 54, 66, 54, 66, 48, 59, 66, 34, 11, 50, 66, 42, 51, 53, 66, 31, 24, 66, 44, 66, 1, 66, 66, 29, 54], 5)
message = result == 594 ? 'Passed' : 'Failed'
puts message
