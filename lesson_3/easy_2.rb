# In this hash of people and their age, see if "Spot" is present.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.key?("Spot") # Could also use #has_key? and #member? and #include?

# Convert the string in the following ways (code will be executed on original munsters_description below):
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase!
p munsters_description.capitalize!
p munsters_description.downcase!
p munsters_description.upcase!

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# add ages for Marilyn and Spot to the existing hash
p ages.merge!(additional_ages) # I had originally used #merge and not #merge! but changed it after seeing the solution.

# See if the name "Dino" appears in the string below.
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("Dino") #Solution uses String#match? instead. 

#Show an easier way to write this array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flin_stones_there_is_no_t_i_swear_there_wasnt_a_t = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
p flin_stones_there_is_no_t_i_swear_there_wasnt_a_t

# How can we add the family pet "Dino" to our usual array:
flin_stones_there_is_no_t_i_swear_there_wasnt_a_t << "Dino"
p flin_stones_there_is_no_t_i_swear_there_wasnt_a_t

# We could have used either Array#concat or Array#push to add Dino to the family.
# How can we add multiple items to our array? (Dino and Hoppy)
flin_stones_there_is_no_t_i_swear_there_wasnt_a_t.concat(["Dino", "Hoppy"]) # Solution used two .push ops or a concat with %w format inside.
p flin_stones_there_is_no_t_i_swear_there_wasnt_a_t

# Shorten the following sentence, using String#slice! to return "Few things in life are as important as" but ""
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!("Few things in life are as important as ")
p advice
# What happens if you use String#slice instead
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice("Few things in life are as important as ")
p advice

# Write a one-liner to count the number of lower-case t characters in the following string
statement = "The Flintstones Rock!"
p statement.count('t') # This should be 1, but whoever wrote this is crazy and wrote it like FLINT STONES (oh no I just googled it and Im the wrong one but I refuse to accept it)

# If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"
((40 - title.length)/2).times { print ' ' }
print title
((40 - title.length)/2).times { print ' ' }
puts
40.times { print '_' }
puts
# I went very overboard with my solution. The actual solution is title.center(40)