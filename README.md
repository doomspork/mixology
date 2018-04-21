# Mixology

This is _not_ a library, it is a collection of tested Elixir examples solving various code challenges.

- [Word Count](https://github.com/doomspork/mixology/blob/master/lib/word_count.ex)

  Count the occurrances of each word in the poem _Charge of the Light Brigade_.
  Return each word and it's number of occurances, ordered from most frequent to least.
  Testing is handled via doctests.

- [Palindrome](https://github.com/doomspork/mixology/blob/master/lib/palindrome.ex)

  Provided with a string ("aabbc") print all possible palindrome premutations ("abcba", "bacab").
  Leverages `ExUnit.CaptureIO` for tests.
