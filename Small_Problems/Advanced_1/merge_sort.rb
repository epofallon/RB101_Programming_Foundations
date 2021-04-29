# Understand the Problem
=begin
  GOAL: Sort an array of passed values using merge sort.
  - explicit rules:
    - the array will onlyy contain one type of data
    - data may be either all numbers or strings
    
  - Merge Sort
    - a recursive sorting algorithm that works by breaking down the array elements into nested sub_arrays, then recombining those nested sub_arrays in sorted order.
    
    [   9   ,   5   ,   7   ,   1   ]
    [ [ 9   ,   5 ] , [ 7   ,   1 ] ]
    [ [ 9 ] , [ 5 ] , [ 7 ] , [ 1 ] ]
    
    [ [ 9 ] , [ 5 ] , [ 7 ] , [ 1 ] ]
    [ [ 5   ,   9 ] , [ 1   ,   7 ] ]
    [   1   ,   5   ,   7   ,   9   ]
    
  Recursive methods have three primary qualities:
  1. They call themselves at least once.
  2. They have a condition that stops the recursion.
  3. They use the result returned by themselves.
=end