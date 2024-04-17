class CountSubarrays
  attr_accessor :count

  def initialize(number_array, number_of_instances)
    @max_number = number_array.max
    @number_of_instances = number_of_instances
    @count = 0
    @number_array = number_array
    count_subarrays
  end

  private

  def count_subarrays
    do_the_count(@number_array.clone)
    do_the_count(@number_array.clone.reverse)
  end

  def do_the_count(array_of_numbers)
    while array_of_numbers.length.positive?
      find_subarrays(array_of_numbers)
      array_of_numbers.shift
    end
  end

  def find_subarrays(array_of_ints)
    max_was_found = 0

    array_of_ints.each do |number|
      next unless number == @max_number

      max_was_found += 1
      @count += 1 if max_was_found >= @number_of_instances
    end
  end
end

result = CountSubarrays.new([1, 3, 2, 3, 3], 2).count
message = result == 6 ? 'Passed' : 'Failed'
puts result
puts message

result = CountSubarrays.new([1, 4, 2, 1], 3).count
message = result.zero? ? 'Passed' : 'Failed'
puts result
puts message

result = CountSubarrays.new(
  [61, 23, 38, 23, 56, 40, 82, 56, 82, 82, 82, 70, 8, 69, 8, 7, 19, 14, 58, 42, 82, 10, 82, 78, 15, 82], 2
).count
message = result == 224 ? 'Passed' : 'Failed'
puts result
puts message
