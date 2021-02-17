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

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def get_name
  name = ''
  loop do
    name = Kernel.gets().chomp()
    break if valid_name?(name)
  end
  name
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

def get_operator
  prompt 'operator_prompt'
  op = ''
  loop do
    op = Kernel.gets().chomp()
    break if valid_operator?(op)
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
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def crunch_numbers(num1, num2, op)
  case op
  when '1'
    num1.to_i() + num2.to_i()
  when '2'
    num1.to_i() - num2.to_i()
  when '3'
    num1.to_i() * num2.to_i()
  when '4'
    num1.to_f() / num2.to_f()
  end
end

def another_calc?
  prompt 'another_calc'
  answer = Kernel.gets().chomp()
  answer.downcase().start_with? 'y'
end

prompt 'welcome'
name = get_name
puts "=> #{messages("greeting")} #{name}"

loop do
  number1 = get_number('first_number')
  number2 = get_number('second_number')
  operator = get_operator
  result = crunch_numbers(number1, number2, operator)
  puts "=> #{messages("result")} #{result.to_s}"
  break unless another_calc?
end

prompt 'good_bye'
