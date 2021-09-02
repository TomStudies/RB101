# Alan wrote the following method, which was intended to show all of the factors of the input number:
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

p factors(10)
# Alyssa noticed that this will fail if the input is 0, or a negative number, 
# and asked Alan to change the loop. How can you make this work without using begin/end/until? 
# Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors_fixed(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
# What is the purpose of the number % divisor == 0 ? The purpose is to make sure there is no remainder, and that it actually IS a factor.
# What is the purpose of the second to last line (factors before the method ends)? It returns the actual array of factors you generated

