def longest_palindrome(string)
  substrings = find_all_substrings(string)
  palindromes = palindromes(substrings)

  max_length = 0
  palindromes.each do |palindrome|
    max_length = palindrome.length if palindrome.length > max_length
  end
  max_length
end

def find_all_substrings(string)
  results = []
  0.upto(string.length - 1) do |current_index|
    current_index.upto(string.length - 1) do |second_index|
      results << string.slice(current_index..second_index)
    end
  end
  results
end

def palindromes(substrings)
  results = []
  substrings.each do |substr|
    results << substr if substr == substr.reverse
  end
  results
end

p longest_palindrome("a") == 1 # 'a'
p longest_palindrome("aa") == 2 # 'aa'
p longest_palindrome("baa") == 2 # 'aa'
p longest_palindrome("aab") == 2 # 'aa'
p longest_palindrome("baabcd") == 4 # 'baab'
p longest_palindrome("baablkj12345432133d") == 9 # '123454321'