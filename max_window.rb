require_relative 'minmaxstackqueue'

def windowed_max_range(array, window)
  arr = array.dup
  stack = MinMaxStackQueue.new

  until stack.size == window
    stack.enqueue(arr.shift)
  end

  max = nil

  until arr.empty?
    temp = stack.max - stack.min
    max = temp if max.nil? || temp > max
    stack.dequeue
    stack.enqueue(arr.shift)
  end

  temp = stack.max - stack.min
  max = temp if max.nil? || temp > max

  max
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

# def windowed_max_range(array, window)
#   array.each_cons(window).map { |set| set.max - set.min }.max
# end
# # O(n^3) = > 2n^3
#
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
