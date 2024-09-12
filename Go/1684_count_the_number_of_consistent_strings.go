func countConsistentStrings(allowed string, words []string) int {
  // put the allowed char in hash table
  charMap := map[rune]bool{}
  for _, char := range allowed {
    charMap[char] = true
  }

  // iterate every char in each element to check if it's allowed
  count := 0
  for _, word := range words {
    for i, char := range word {
      if !charMap[char] { break }
      if i == len(word) - 1 { count++ }
    }
  }

  return count
}
