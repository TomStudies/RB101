# Gather loan amount, APR, and loan duration from user.
# Calculate monthly interest rate, loan duration, and monthly payment. (formula provided by LS: m = p * (j / (1 - (1 + j)**(-n))) )
# m = monthly payment, p = loan amount, j = monthly interest rate, n = duration in months
# PEDAC:
  # Input: loan amount (float), APR (float), loan duration (years int)
  # Output: monthly interest rate % (float), loan duration (months int), monthly payment (float rounded to two decimal)
  # Rules: All numbers should be >=0, input should check for that.
  # Data: Floats, ints, strings, all controlled by calculation methods.
  # Algorithm: Seperate methods for calculating monthly interest rate, loan duration, and montly payment. Loop whole user input portion to let them calculate diff. scenarios.

def monthly_interest(apr)
  apr / 12
end

def loan_months(years)
  years * 12
end

def monthly_payment(amt, monthly, months)
  amt * ((monthly * 0.01) / (1 - (1 + (monthly * 0.01))**(-months)))
end

def valid_int?(input)
  input.to_i.to_s == input && input.to_i >= 0
end

def valid_float?(input)
  (input.to_f.to_s == input || (input.to_f.to_s + "0") == input) && (input.to_f * 100) % 1 == 0.0 && input.to_f >= 0
end

Kernel.puts("This calculator can determine monthly interest rate, loan duration, and monthly payment.")
loop do
  Kernel.puts("Please input the total loan amount without commas up to two decimal places. (For example, for a $10,025.50 loan, enter 10025.50)")
  amount = ''
  loop do
    amount = Kernel.gets().chomp()
    if valid_float?(amount)
      break
    else
      puts("Your input is invalid. Please check and try again.")
    end
  end
  
  Kernel.puts("Please input the APR to two decimal places. (For example, for a 5.85% APR, enter 5.85)")
  apr = ''
  loop do
    apr = Kernel.gets().chomp()
    if valid_float?(apr)
      break
    else
      puts("Your input is invalid. Please check and try again.")
    end
  end
  
  Kernel.puts("Finally, please input the duration of the loan in years. (For example, for 12 years, enter 12)")
  years = ''
  loop do
    years = Kernel.gets().chomp()
    if valid_int?(years)
      break
    else
      puts("Your input is invalid. Please check and try again.")
    end
  end
  
  monthly = monthly_interest(apr.to_f())
  months = loan_months(years.to_i())
  Kernel.puts("Monthly interest: $#{monthly.round(2)}")
  Kernel.puts("Loan duration in months: #{months}")
  Kernel.puts("Monthly payment: $#{(monthly_payment(amount.to_f(), monthly, months)).round(2)}")
  
  Kernel.puts("\nPress Y to perform another calculation.")
  another = Kernel.gets().chomp()
  if another.downcase != 'y'
    break
  end
  
end

# Things to work on tomorrow: Weird bug in the valid_float method invalidating 10025.20, proper decimal rounding on return values.
