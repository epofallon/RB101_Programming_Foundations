=begin
ask the user for loan amount
ask the user for the annual percentage rate
ask the user for the loan duration

calculate monthly interest rate
calculate loan duration in months
calculate monthly payment

display results
=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt "Welcome to loan calculator!"
prompt "---------------------------"

loop do
  prompt "What is the loan amount?"

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()

    if loan_amount.empty?() || loan_amount.to_f() < 0
      prompt('Must eneter positive number')
    else
      break
    end
  end

  prompt("What is the Annual Percentage Rate?")

  apr = ''
  loop do
    apr = Kernel.gets().chomp()

    if apr.empty?() || apr.to_f() < 0
      prompt('Must eneter positive number')
    else
      break
    end
  end

  prompt "What is the loan term in years?"

  loan_duration_yearly = ''
  loop do
    loan_duration_yearly = gets.chomp

    if loan_duration_yearly.empty?() || loan_duration_yearly.to_f() < 0
      prompt('Enter a valid number')
    else
      break
    end
  end

  monthly_interest = ((apr.to_f / 100) / 12)

  loan_duration_monthly = loan_duration_yearly.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**(-loan_duration_monthly)))

  prompt "Your monthly payments is: $#{monthly_payment.round(2)}"

  prompt("Calculate another loan?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase == 'y'
end

prompt('Thanks for using the loan calculator!')
