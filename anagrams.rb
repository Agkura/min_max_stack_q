def first_anagram?(string1, string2)
  perms = string1.chars.permutation.map { |array| array.join }
  perms.include?(string2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true


def second_anagram?(string1, string2)
  str1 = string1.dup
  str2 = string2.dup

  string1.chars.each do |char1|
    if string2.include?(char1)
      str1.delete!(char1)
      str2.delete!(char1)
    end
  end

  str1.empty? && str2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(string1, string2)
  string1.chars.sort.join == string2.chars.sort.join
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(string1, string2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  string1.each_char do |char|
    hash1[char] += 1
  end

  string2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2

end

def bonus_anagram?(string1, string2)
  hash1 =Hash.new(0)

  string1.each_char do |char|
    hash1[char] += 1
  end

  string2.each_char do |char|
    hash1[char] -= 1
  end

  hash1.values.all? { |value| value == 0 }
end


p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true
