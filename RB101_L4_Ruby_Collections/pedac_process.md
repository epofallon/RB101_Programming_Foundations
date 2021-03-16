# The PEDAC Process

## P: Understanding the Problem
- Establish the rules / define the boundaries of the problem
  - Examine & analyze any/all information about the problem
    - Helpful to restate the problem either in your own words or a different format
    - Extract elements of the problem into a list of rules/requirements
      - Explicit: those clearly stated in the problem description
      - Implicit: those not stated in the problem description, but can be
                  extrapolated from our understanding of the problem based
                  on problem analysis, examples, test cases...
        - Asking questions makes implicit requirements explicit
      - Extracting rules & boundaries helps us form a mental model for the problem
  - *Spend enough time here. Don't rush this step. Clearly understand the problem before moving on.
  - Making our understanding of the problem more explicit, which in turn helps when thinking
    about the data structures and algorithms required to solve the problem and the code
    implementation of the solution.

**General Example**
Statement: Given a string, produce a new string with every other word removed.

- Explicit requirements:
  - Input : string
  - Output: new string
  - Remove every other word from the input string

- Questions:
  - What do we mean by every other word?
  - How do we define a word in this context?
    - Words are delimeted by spaces.
  
  * How you get answers to your questions depends on the context in which
    you encounter the problem

## E: Examples and Test Cases
- Examples help us to expand upon and clarify our initial understanding of the problem
- Either confirms or refutes the assumptions we made about the problem
- Help answer questions regarding implicit requirements
- Act as assertions which help to codify the rules and boundaries

## D: Data Structures
- Structuring data helps us to reason with it more easily
- Working with structured data helps us interact with the data in a logical way at implementation level
- Thinking about how data is structured and represented is often an important part of
  the overal problem solving process
- How we structure data when solving a problem is closely related to the algorithm for our solution
  - The algorithm is a set of steps that determine how to get from the input to the output

- Summary
  - Help reason with data logically
  - Help interact with data at implementation level
  - Thinking in terms of data structures is part of the problem solving process
  - Data structures closely linked to algorithm
    - Set of steps from input to output
      - Involves structuring data in a certain way

## A: Algorithm
- A logical sequence of steps for accomplishing a task of objcetive
  - Closely linked to data Structures
  - Series of steps to structure data to produce the required output
- Stay abstract / high-level
  - Avoid implementation detail
  - Don't worry about efficiency for now

## C: Implementing a solution in Code
- Translating our solution algorithm to code
- Think about the algorithm in the context of programming language
  - Language features and constraints
  - Characterisitcs of data structures
  - Built in functions / methods
  - Syntax and coding patters
- Create test cases
- Code with intent


## Sum Even Number Rows
Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in
rows, with the first row containing one integer, the second row two integers, the third row three
integers, and so on. Given an integer representing the number of a particular row, return an
integer representing the sum of all the integers in that row.

**Rules / Requirements**
- Sequence of even integers
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped into rows
- Each row is incrementally larger: 1, 2, 3, ...
- Row 'number' equals the number of elements in the row
  - Row 1 has 1 element, row 2 has 2 elements, ...
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the integers in the row identified by the input integer

- Sequence:
2, 4, 6, 8, 10, 12, 14, 16, 18, ...

2
4,  6
8,  10, 12
14, 16, 18, 20
....

- How do we create the structure?

**Test Case / Examples**
row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68

2 --> 2
4,  6 --> 10
14, 16, 18, 20 --> 68 Confirms intial structure

**Data Structure**
2
4,  6
8,  10, 12
14, 16, 18, 20
....

- Overall structure representing a sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence
- Individual rows contain integers
- Can assume that integers are in a set order in the context of the sequence

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ....
]

**Algorithm**
1. Create an empty 'rows' array to contain all of the rows
2. Create 'row' array and add it to the overall 'rows' array
3. Repeat step 2 until all the necessary rows have been created
  - rows have been created when the length of 'rows' array is equal to the input integer
4. Sum the final row
5. Return the sum of the final row

- Calculating the start integer:
  - Rule: first integer of the row == last integer of preceding row + 2
  - Algoritm:
    - Get the preceding row
    - Get the last integer of that row
    - Add 2 to the integer #STOPPED AT 34:42 IN VIDEO
*Problem: Create a Row*
Rules:
- Row is an array
- Array contains integers
- Integers are consecutive even numbers
- Integers in each row form part of an overall larger sequence
- Rows are of different lengths

- Input: the information needed to create the output
  - The starting integer
  - Length of the row
- Output: the row itself: '[8, 10, 12]'

Examples:
start: 2, length: 1 --> [2]
start: 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]

Data Structure:
- An array of integers

Algorithm:
1. Create an empty 'row' array to contain the integers
2. Add the starting integer
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 & 3 until the array has reached the correct length
5. Return the 'row' array

- Start the loop
  - Add the start integer to the row
  - Increment the start integer by 2
  - Break out of the loop if length of row = row_length