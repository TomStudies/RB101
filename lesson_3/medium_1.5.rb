LIMIT = 15

def fib(first_num, second_num)
  while first_num + second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# What is wrong is that methods have their own scope and cannot access variables defined outside.
# We could solve by making limit a constant (LIMIT) * Solution calls for handing limit to the method as an additional argument
