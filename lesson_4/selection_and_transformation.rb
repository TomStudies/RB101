def select_fruit(food_hash)
  fruits_hash = Hash.new
  food_hash.each do |key, val| 
    fruits_hash[key] = val if val == "Fruit"
  end
  fruits_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

#------------------------------------------------------------------------------

def double_numbers!(numbers)
  numbers.map! { |num| num * 2 }
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers
p my_numbers.object_id
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers
p my_numbers.object_id

#------------------------------------------------------------------------------

def double_odd_indeces(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indeces(my_numbers)

my_numbers

#------------------------------------------------------------------------------
def multiply(numbers, amt)
  numbers.map! { |num| num * amt }
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]