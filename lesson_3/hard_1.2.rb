greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# I got this one wrong, just wanted to keep track of it for posterity,
# greetings will be modified to say "hi there".
# In line 2, informal_greeting is pointed at the same memory unit as g[:a]
# Therefore, when String#<< is called it modifies the object (mutates the caller)
# And therefore it is changed within greetings itself.