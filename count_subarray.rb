class CountSubarrays
  attr_accessor :count

  def initialize(number_array, number_of_instances)
    @max_number = number_array.max
    @number_of_instances = number_of_instances
    @count = 0
    count_subarrays(number_array)
  end

  private

  def count_subarrays(number_array)
    while number_array.length.positive?
      find_subarrays(number_array)
      number_array.shift
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
puts message

result = CountSubarrays.new([1, 4, 2, 1], 3).count
message = result.zero? ? 'Passed' : 'Failed'
puts message
