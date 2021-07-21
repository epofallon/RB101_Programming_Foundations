=begin
- input: a string of text
  - 
- output: an array of the top three words
  - lowercased
- explicit requirements: 
  - letters and apostophes are words
  - case-insensitive
- questions: 
  - 
- implicit requirements:
  - word can include apostraphe but cannot have only apostraphe (must have letters)
- data structure:
  - an array of words
  - a hash for count
  
- algortihm:
  - initialize hash with a default of 0
  - split the input string into an array of words
  - iterate through the words
    - if the downcased word includes letters
      - increment the hash with key being stripped down word by 1
        - stripped --> downcased & removed all but letters and apostrophes
  - initialize three_most to sorting the hash using max_by and flatten
  - 
  
=end
def top_3_words(sentence)
  word_counts = Hash.new(0)
  sentence.split.each do |word|
    word = word.downcase
    if word.chars.any? {|char| ('a'..'z').include?(char) }
      stripped_word = word.gsub(/[^a-z\']/, '')
      word_counts[stripped_word] += 1
    end
  end
  word_counts.max_by(3) {|word, count| count}.to_h.keys
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
