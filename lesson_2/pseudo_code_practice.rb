=begin
Lesson 2 Pseudocode practice

1a. A method that returns the sum of two integers (casual)

Method simply adds the two integers (num1 and num2) given to it. Automatically acts as a return.

1b. A method that returns the sum of two integers (formal)

START
Method header (num1, num2)
  add num1 and num2
end method
END

2a. A method that takes an array of strings, and returns a string that is all those strings concatenated together. (casual)

Method simply returns array#join on the original array.

2b. A method that takes an array of strings, and returns a string that is all those strings concatenated together. (formal)

START
Method header (strings)
  strings.join()
end method
END

3a. A method that takes an array of integers, and returns a new array with every other element. (casual)

Method first initializes an empty array to be returned. It then iterates over the given array of integers, and checks whether the index modulo 2 is 0 or not. If 0, it gets added to the new array.
In the end, it returns the new array.

3b. A method that takes an array of integers, and returns a new array with every other element. (formal)

START
Method header (integers)
  SET new array = empty
  WHILE iterating over integers
    IF integers index of current integer % 2 == 0
      new array << current integer
new array
END

=end
#Trying to implement them for real
def add(num1, num2)
  num1 + num2
end

def combine(strings)
  strings.join()
end

def every_other(integers)
  output = []
  integers.each do |int|
    if integers.index(int) % 2 == 0
      output << int
    end
  end
  output
end

puts add(10, 2)

puts combine(["I", "am", "many", "spaceless", "strings"])

p every_other([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])