# # Given the string of chars a..z A..Z do as in the sample cases.
# # (This is an easier problem).

# p accum("abcd") == "A-Bb-Ccc-Dddd"
# p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# p accum("cwAt") == "C-Ww-Aaa-Tttt"


# You have to create a method thata takes a positive integer number
# and return the next bigger number formed by the same digits:

# 12 --> 21
# 513 --> 531
# 2017 --> 2071

# If no bigger number can be composed using those digits return -1
# 9 --> -1
# 111 --> -1
# 531 --> -1