def count_subarrays(number_array, k)
  @results = 0
  @k = k
  @number_array = number_array

  while number_array.length.positive?
    find_subarrays(number_array)
    number_array.shift
  end

  @results
end

def find_subarrays(array_of_ints)
  max_was_found = 0

  array_of_ints.each do |number|
    next unless number == max_number

    max_was_found += 1
    @results += 1 if max_was_found >= @k
  end
end

def max_number
  @max_number ||= @number_array.max
end

result = count_subarrays([1, 3, 2, 3, 3], 2)
message = result == 6 ? 'Passed' : 'Failed'
puts message

result = count_subarrays([1, 4, 2, 1], 3)
message = result.zero? ? 'Passed' : 'Failed'
puts message
