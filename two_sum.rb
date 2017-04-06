arr = [0,1,5,7]

def brute_two_sum(array, target)
  array.each_with_index do |num, idx|
    (idx...array.length).each_with_index do |int, index|
      next if idx == index
      return true if array[idx] + array[index] == target
    end
  end
  false
end
# O(n^2)
# p brute_two_sum(arr, 6)
# p brute_two_sum(arr,10)


def sorting_two_sum(array, target)
  arr = array.sort
  arr.each_with_index do |int, idx|
    search_array = array[0...idx] + array[(idx + 1)..-1]
    return true if search_array.bsearch { |x| x == target - int }
  end
  false
end
#O(n log n) => nlogn + n * logn
# p sorting_two_sum(arr, 6)
# p sorting_two_sum(arr, 10)

def hash_two_sum(array, target)
  hashy = Hash.new(0)
  array.each do |int|
    hashy[int] += 1
  end

  hashy.keys.each do |key|
    hashy[key] -= 1
    return true if hashy[target - key] > 0
  end

  false
end

#O(n) => 2n
# p hash_two_sum(arr, 6)
# p hash_two_sum(arr, 10)







just_array = [1,2,3,4,5,6,7]
target = 18

def brute_four_sum(array, target)
  array.each_with_index do |num, a|
    (0...array.length).each_with_index do |int, b|
      next if a == b
      (0...array.length).each_with_index do |number, c|
        next if b == c || a == c
        (0...array.length).each_with_index do |integer, d|
          next if c == d || a == d || b == d
          # p [a,b,c,d]
          return true if array[a] + array[b] + array[c] + array[d] == target
        end
      end
    end
  end
  false
end
p brute_four_sum(just_array, target)
p brute_four_sum(just_array, 2)
