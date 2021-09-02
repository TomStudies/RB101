def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
  
  # Make more clear by turning both to +=, then adding a return a_string_param, an_array_param. Makes it easier for future progbrammers and more predictable result.
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkins"
puts "My array looks like this now: #{my_array}" # "[pumpkins, rutabaga]" The difference is the << operator mutates the caller while += does not to my understanding
