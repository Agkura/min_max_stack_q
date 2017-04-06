a = [2,3,-6,7,-6,7]
b = [-5,-1,-3]

def my_min1(array)
  array.each_with_index do |int, idx|
    min = true
    array.each_with_index do |number, index|
      next if idx == index
      min = false if number < int
    end
    return int if min
  end
end

def my_min(array)
  min = array.first
  array.each do |int|
    if int < min
      min = int
    end
  end
  min
end

def largest_sub_sum1(array)
  subs = []
  array.each_with_index do |int, i|
    (i...array.length).each_with_index do |num, idx|
      subs << array[i..(i + idx)]
    end
  end
  subs.map! { |array| array.inject(&:+) }
  subs.max
end

def largest_sub_sum(array)
  largest_sum = array.shift
  current_sum = largest_sum
  array.each do |int|
    current_sum = 0 if current_sum < 0
    current_sum += int
    largest_sum = current_sum if current_sum > largest_sum
  end
  largest_sum
end
