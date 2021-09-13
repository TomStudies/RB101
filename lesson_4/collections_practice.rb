# 1: Turn this array into a hash where the names are the keys and the values are the positions in the array.
# Input: flintstones array
# Output: Hash of flintstone names as keys and position as the value.
# Rules: Use position
# Examples: Result should be { "Fred" => 1, "Barney" => 2, etc }
# Data structures: Collections, enumerables, array and hash
# Algorithm: Add each flintstone to a new hash, assigning their value based on the position in the hash.
#   Can use each_with_object to assign them to the hash and an external index counter
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = flintstones.each_with_object({}) do |flintstone, new_hash|
  new_hash[flintstone] = flintstones.index(flintstone) + 1
end

p flintstones_hash
# Solution uses Enumerable#each_with_index to simplify the begetting of the index, and simply assigns on each iteration instead of using an external assignment.

# ==============================================================================
# 2: Add up all the ages from the munster family hash
# Input: ages hash
# Output: integer of age total
# Rules: None
# Examples: Should return 6174
# Data structures: Hash, array, int
# Algorithm: Fetch the values from ages into an array. Sum the array into a total variable.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_age = 0
ages.values.each { |age| total_age += age } # Could have used Enumerable#inject(:+), or simply Array#sum
p total_age

#Solution used a .each on the hash itself with a throwaway key variable, basically creating a more efficient version of mine.

# ==============================================================================
# 3: Remove people with age 100 and greater from the ages hash (I will just use the one declared above.)
# Input: ages hash
# Output: hash with everybody over 100 removed
# Rules: Do not mutate ages itself (self set rule, want to maintain it for future exercises)
# Examples: Should return { "Herman" => 32, "Lily" => 30, "Eddie" => 10, "Marilyn" => 22}
# Data structures: Hash
# Algorithm: select out of ages those with a value less than or equal to 100. Assign them and their key to a new hash, print that hash.
younguns = ages.select { |person, age| age <= 100 }
p younguns
p ages

# Solution uses Hash#keep_if, which is basically a Hash#select! operation but returns nil if no changes were made.
# Solution is destructive, but I kept mine non-destructive so I could use the ages hash again without reassignment.

# ==============================================================================
# 4: Pick out the minimum age from the ages hash
# Input: ages hash
# Output: Integer (the lowest in the hash)
# Rules: None
# Examples: Should return 10
# Data structures: hash, integer
# Algorithm: Set external value lowest_age equal to the first value in ages.
# For each value in ages, check if it is lower than lowest_age.
# if it is, assign lowest_age to that value.
# p lowest age.
age_nums = ages.values
lowest_age = age_nums[0]
age_nums.each do |age|
  lowest_age = age if age < lowest_age
end
p lowest_age

# Solution simply returns ages.values.min. Array#min returns the minimum valued selection from the array.

# ==============================================================================
# 5: Find the index of the first name that starts with "Be" in the flintstones array below
# Input: flintstones array
# Output: Integer index of first "Be" name
# Rules: "Be" name
# Examples: Should be 3
# Data structures: Array
# Algorithm: Initiate a loop that goes through each index of flintstones.
# If the flintstone at the index starts with "Be", save that index to be_index.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
be_index = ''
loop_index = 0
loop do
  if flintstones[loop_index].start_with?('Be')
    be_index = loop_index
    break
  end
  loop_index += 1
  break if loop_index >= flintstones.length 
end
p be_index

# Solution is, again, infinitely more efficient than mine.
# Solution uses Array#index with a block, which returns the first index for which the block returns a truthy value.
# flintstones.index { |name| name[0, 2] == "Be" }

# ==============================================================================
# 6: Amend the flintstones array so the names are all shortened to just the first three characters.
# Input: flintstones array
# Output: shortened array (mutated flintstones array)
# Rules: First three letters
# Examples: Should return ["Fre", "Bar", "Wil",...]
# Data structures: Array, string
# Algorithm: map! over the array with the first 3 characters of each string.
flintstones.map! { |string| string[0..2] } # Solution used a different format, they used string[0, 3]
p flintstones

# ==============================================================================
# 7: Create a hash that expresses the frequency with which each letter occurs in the statement. **DIFFICULT FOR ME
# Input: string statement
# Output: count of each letter in a hash
# Rules: Capitals and lower case counted differently, final return is in ascending order
# Examples: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
# Data structures: String to hash
# Algorithm:
# Challenges: I don't know how to order a hash. Therefore I need to make an ordered 2D array and then convert it to a hash.
# I am directly posting the solution. My attempts all failed and were overly complicated.
statement = "The Flintstones Rock"
result = {} # Declare a result hash
letters = ('A'..'Z').to_a + ('a'..'z').to_a #Create a reference array of all the letters, capital and lowercase. This automatically orders them as well.

letters.each do |letter|
  letter_frequency = statement.count(letter) #Counts the letters and assigns that count to a new variable
  result[letter] = letter_frequency if letter_frequency > 0 #Stores those that have a letter count in the hash
end

p result

#Since I could not do this on my own, I examined the solution and wrote notes for all relevant lines. I hope that this will help further my understanding.

# ==============================================================================
# 9: Write a method called titlesize that capitalizes the first character in each word like a title would be
# Input: string phrase
# Output: string title style
# Rules: Capitalize the first letter of each word
# Examples: "the flintstones rock" => "The Flintstones Rock"
# Data structures: String
# Algorithm: Split the string into an array of the words it contains.
# Capitalize the first letter of each of the words in the array
# Convert the array to a string separated by spaces.
words = "the flintstones rock"
words_array = words.split
capitalized_sentence = ''
words_array.each do |word|
  if word.length > 1
    capitalized_sentence << word[0].upcase + word[1..-1]
  else
    capitalized_sentence << word.upcase
  end
  if words_array.index(word) != words_array.length - 1
    capitalized_sentence << ' '
  end
end

p capitalized_sentence

# Once again I am disappointed by my inability to be as efficient as the solution.
# The solution used many methods where I did not:
# String#capitalize to capitalize the words
# Array#join(' ') to join the array into a string by spaces at the end
# It was all done on one line with three separate method calls and a block with 1 inside it

# ==============================================================================
# 10: Modify the munsters hash below such that each member of the family has an extra "age_group" key that has one of three values (kid, adult, or senior)
# Input: munsters 2d hash
# Output: Modified munsters 2d hash (new key with appropriate) values
# Rules: 0-17 is kid, 18-64 is adult, senior 65+
# Examples: Herman will be an adult, Grandpa a senior, Eddie a kid
# Data structure: Hashes
# Algorithm: For each external person's hash, map over their internal details:
#   If details[age] is 0-17, set "age_group" to "kid". Follow this formula for other options.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.map do |name, details|
  if details["age"] <= 17 # Solution used a case statement with ranges instead of ifs, probably better for avoiding strange edge cases.
    details["age_group"] = "kid"
  elsif details["age"] <= 64
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters