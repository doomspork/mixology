# Mixology

This is _not_ a library, it is a collection of tested Elixir examples solving various code challenges.

### Examples

- [Fibonacci](https://github.com/doomspork/mixology/blob/master/lib/fibonacci.ex)

  Given a integer _N_, print out _N_ steps of the Fibonacci sequence.
  Testing is handled via doctests.
  
  ```elixir
  iex> Fibonacci.run(12)
  [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
  ```

- [Word Count](https://github.com/doomspork/mixology/blob/master/lib/word_count.ex)

  Count the occurrances of each word in the poem _Charge of the Light Brigade_.
  Return each word and it's number of occurances, ordered from most frequent to least.
  Testing is handled via doctests.
  
  ```elixir
  iex> WordCount.run("./priv/charge_of_the_light_brigade.txt")
  [{"the", 25}, {"of", 14}, {"and", 9}, {"them", 7}, {"six", 7},
   {"hundred", 7}, {"to", 7}, {"they", 7}, {"cannon", 6}, {"rode", 6}]
  ```
  
- [Palindrome](https://github.com/doomspork/mixology/blob/master/lib/palindrome.ex)

  Provided with a string ("aabbc") print all possible palindrome premutations ("abcba", "bacab") to IO.
  Leverages `ExUnit.CaptureIO` for tests.
  
    ```elixir
  iex> Palindrome.run("aabbc")
  bacab
  abcba
  :ok
  ```
