def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end

def fibonacci(n)
  n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765