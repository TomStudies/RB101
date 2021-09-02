# Fix the code (return a false condition, handle the case that there are more or fewer than 4 components to be invalid)
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.length != 4 # solution uses unless == 4.
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word) # Fixed correctly.
  end
  return true # Could be shortened to just true
end