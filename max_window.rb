#
# def windowed_max_range(array, window)
#   array.each_cons(window).map { |set| set.max - set.min }.max
# end
# # O(n^3) = > 2n^3
#
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
require_relative 'stackqueue'

def windowed_max_range(array, window)
  

end
