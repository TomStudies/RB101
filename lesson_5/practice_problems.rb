# Practice with sorting, nested collections, and blocks.

# 1: Order this array of number strings by descending numeric value.
arr = ['10', '11', '9', '7', '8']
p arr.sort_by { |x| -x.to_i }
# Solution uses a block, with b and a's positions swapped in a rocketship operator.
=begin
arr.sort do |a,b|
  b.to_i <=> a.to_i * I like this part a lot. By just switching a and b you can reverse the calculation.
end
=end

# 2: How would you order this array of hashes based on the year of publication of each book, from earliest to latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
p books.sort_by { |hash| hash[:published].to_i }
# My conversion to integer was not totally necessary since strings also have a <=> method and the strings in question were all 4 characters.

# 3: For each of these collection objects demonstrate how you would reference the letter 'g'.
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0)

# 4: For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2
hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2

# 5: Given this nested hash, figure otu the total age of just the male members of the family.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
age = 0
munsters.each do |name, info| #Solution uses each_value to eliminate the need for two variables
  if info['gender']== 'male'
    age += info['age']
  end
end
p age

# 6: Using the same hash from above, print out the name, age, and gender from each family member in the following format:
# (Name) is a (age)-year-old (male or female).
munsters.each do |name, info|
  puts "#{name} is a #{info['age']}-year-old #{info['gender']}."
end

# 7: Given this code, what would be the final values of a and b? Try to work this out without running the code.
a = 2
b = [5, 8]
arr = [a, b]
# arr = [2, [5, 8]]
arr[0] += 2
# arr = [4, [5, 8]]
arr[1][0] -= a
# arr = [4, [3, 8]]
# I forgot to list the final values of a and b, I forgot the question and just figured out the end result of the operations.
# Solution: a = 2, b = [3, 8]
# Takeaway: When b is passed into the assignment of arr, it is referenced.

# 8: Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %w(a e i o u)
hsh.each do |item, array| # Remember: Always viable to just use an underscore for an unused variable name
  array.each do |string|
    string.each_char do |char|
      if VOWELS.include?(char.downcase) # Could have used single line format
        print char + ' '
      end
    end
  end
end
puts

# 9: Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr2 = arr.map do |sub_arr|
  sub_arr.sort.reverse # Could also be done with a sort + block b <=> a
end
p arr2

# 10: Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr2 = arr.map do |sub_arr|
  sub_arr.map do |item|
    if item.class == Integer
      item + 1
    else
      item
    end
  end
end
p arr
p arr2 # I accidentally used the array from example 9. Re doing with the correct data structure:
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr2 = arr.map do |hash|
  return_hash = Hash.new
  hash.each do |key, value|
    return_hash[key] = value + 1
  end
  return_hash
end
p arr
p arr2

# 11: Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr2 = arr.map do |sub_arr|
  sub_arr.select { |int| int % 3 == 0 }
end
p arr
p arr2

# 12: Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
hashified = Hash.new
arr.each_with_object(hashified) do |sub_arr, hsh|
  hsh[sub_arr[0]] = sub_arr[1]
end
p hashified

# 13: Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# Should look like: [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
arr2 = arr.sort_by do |sub_arr|
  sub_arr.map do |element| # Solution uses select
    element if element.odd? # Solution uses select and num.odd?
  end
end
p arr2

# 14: Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# Should look like: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
colorsizes = hsh.map do |food, info|
  if info[:type] == 'fruit'
    info[:colors].map { |color| color.capitalize }
  else
    info[:size].upcase
  end
end
p colorsizes

# 15: Given this data structure write some code to return an array which contains only the hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr2 = arr.select do |hash|
  torf = true
  hash.each do |letter, numbers|
    if numbers.any? { |num| num.odd? }
      torf = false
    end
  end
  torf
end
p arr2

# Solution calls all? first on the hash, then again on the values of the hash. This is a simpler one than what I came up with.

# 16: Write a method that returns one UUID when called with no parameters.
ALPHANUMS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0)
def generate_uuid
  uuid = ''
  8.times do 
    uuid << ALPHANUMS[rand(ALPHANUMS.size)]
  end
  uuid << '-'
  4.times do 
    uuid << ALPHANUMS[rand(ALPHANUMS.size)]
  end
  uuid << '-'
  4.times do 
    uuid << ALPHANUMS[rand(ALPHANUMS.size)]
  end
  uuid << '-'
  4.times do 
    uuid << ALPHANUMS[rand(ALPHANUMS.size)]
  end
  uuid << '-'
  12.times do 
    uuid << ALPHANUMS[rand(ALPHANUMS.size)]
  end
  uuid
end # Solution uses an array to store the sizes of the substrings, and sample to pull a random digit from the array.
p generate_uuid