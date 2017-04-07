require 'benchmark'
include Benchmark

require_relative 'minmaxstackqueue'

def windowed_max_range(array, window)
  window_range = array.dup
  stack = MinMaxStackQueue.new

  until stack.size == window
    stack.enqueue(window_range.shift)
  end

  max = nil

  until window_range.empty?
    temp = stack.max - stack.min
    max = temp if max.nil? || temp > max
    stack.dequeue
    stack.enqueue(window_range.shift)
  end

  temp = stack.max - stack.min
  max = temp if max.nil? || temp > max

  max
end
# O(n)

# an_array = (-1_000..1_000).to_a.shuffle
# target = 2
#
# Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
#   tf = x.report("window") {print windowed_max_range(an_array,target)}
#   tt = x.report("sorting") {windowed_max_range(an_array,target)}
#   tu = x.report("hash") {windowed_max_range(an_array,target)}
# end


# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

# def windowed_max_range(array, window)
#   array.each_cons(window).map { |set| set.max - set.min }.max
# end
# # O(n^3) = > 2n^3
#
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
