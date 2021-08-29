# Ask the user for two numbers
# Ask the user for an operation
# Perform the operation on the two numbers
# Output the result (no longer relevant but keeping in the file for posterity)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(num)
  if num.to_i == 0 || num.to_f == 0.0
    if num == '0' || num =~ /0.0/
      return true
    end
    false
  else
    return true
  end
end # Solutions to the integer and float problems provided by the solution are probably much more elegant than mine.

def operation_to_message(op)
  word =  case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end
  # Code can go here if need be
  word
end

def messages(message, lang='en')
  MESSAGES[lang][message] # I only implemented partial language support. I am not sure how to do YAML file entry for certain parts.
end

prompt("Please select your language. (EN, ZH)")
lang = ''
loop do
  lang = Kernel.gets().chomp().downcase()
  if lang.empty?() || (lang != 'zh' && lang != 'en')
    prompt(MESSAGES['en']['invalid'])
  else
    break
  end
end

prompt(messages('welcome',lang))
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages('invalid',lang))
  else
    break
  end
end

loop do # Main loop
  number1 = 0
  number2 = 0
  loop do
    prompt(messages('first',lang))
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(messages('invalid',lang))
    end
  end

  loop do
    prompt(messages('second',lang))
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(messages('invalid',lang))
    end
  end

  # Heredoc
  operator_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = 0
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('choose',lang))
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  prompt("The result is #{result}.")

  prompt(messages('again?',lang))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('bye',lang))

# Keep in mind, if expressions can return a value.
# answer = if true
#           'yes'
#        else
#           'no'
#         end  # => yes
