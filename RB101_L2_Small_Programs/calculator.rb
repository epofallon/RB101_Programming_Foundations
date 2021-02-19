require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def clear
  system("clear") || system("cls")
end

def welcome
  clear
  prompt 'welcome'
  get_name
end

def get_name
  name = ''
  loop do
    name = Kernel.gets().chomp()
    break if valid_name?(name)
  end
  puts "=> #{messages('greeting')} #{name}"
end

def valid_name?(name)
  name.empty? ? prompt('valid_name') : name
end

def get_number(message)
  number = ''
  loop do
    prompt message
    number = Kernel.gets().chomp()
    break if valid_number?(number)
    prompt('valid_number')
  end
  number
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def zero_div?(num, op)
  num.to_i == 0 && op == '4'
end

def get_operator(num2)
  prompt 'operator_prompt'
  op = ''
  loop do
    op = Kernel.gets().chomp()
    if valid_operator?(op) && zero_div?(num2, op) != true
      break
    elsif zero_div?(num2, op)
      prompt('divided_by_zero')
    end
    prompt('valid_operator')
  end
  puts "=> #{operation_to_message(op)} #{messages('operation_message')}"
  op
end

def valid_operator?(op)
  %w(1 2 3 4).include? op
end

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

def crunch_numbers(num1, num2, op)
  result = case op
           when '1'
             num1.to_f() + num2.to_f()
           when '2'
             num1.to_f() - num2.to_f()
           when '3'
             num1.to_f() * num2.to_f()
           when '4'
             num1.to_f() / num2.to_f()
           end
  puts "=> #{messages('result')} #{result}"
end

def another_calc?
  answer = ''
  loop do
    prompt 'another_calc'
    answer = Kernel.gets().chomp().downcase()
    break if valid_response?(answer)
    prompt 'valid_reply'
  end
  answer == 'y'
end

def valid_response?(reply)
  %w(y n).include? reply
end

welcome

loop do
  number1 = get_number('first_number')
  number2 = get_number('second_number')
  operator = get_operator(number2)
  crunch_numbers(number1, number2, operator)
  break unless another_calc?
  clear
end

prompt 'good_bye'
