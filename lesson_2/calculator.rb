#Ask the user for two numbers
#Ask the user for an operation
#Perform the operation on the two numbers
#Output the result

Kernel.puts("Welcome to the Calculator!")
Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()
Kernel.puts("The first number is #{number1}.")

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()
Kernel.puts("The second number is #{number2}.")

Kernel.puts("What operation would you like to perform? 1: add 2: subtract 3: multiply 4: divide")
operator = Kernel.gets().chomp()

if operator == "1"
  result = number1.to_i() + number2.to_i()
elsif operator == "2"
  result = number1.to_i() - number2.to_i()
elsif operator == "3"
  result = number1.to_i() * number2.to_i()
elsif operator == "4"
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}.")

#Keep in mind, if expressions can return a value.
answer = if true
           'yes'
         else
           'no'
         end  # => yes