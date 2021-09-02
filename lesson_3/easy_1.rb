# Programmatically determine if 42 lies between 10 and 100.
(10..100).each do |num| 
  puts "42 detected." if 42 == num 
end
# Solution used Range#cover?

# Starting with the string:
famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.
famous_words = "Four score and " + famous_words
puts famous_words
famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")
puts famous_words
# Solution also used String#prepend, and the << operator with famous_words second.

# If we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this nested array:
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make it an un nested array.
flintstones.flatten!
p flintstones

# Given the hash below
flintstones2 = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# Turn this into an array containing only two elements: Barney's name and Barney's number
barney = flintstones2.assoc("Barney")
p barney