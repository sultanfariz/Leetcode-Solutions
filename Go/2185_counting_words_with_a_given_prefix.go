func prefixCount(words []string, pref string) int {
  res := 0
  for _, word := range words {
    if len(word) < len(pref) { continue }
    
    res++
    for i, char := range pref {
      if string(word[i]) != string(char) {
        res--
        break
      }
    }
  }

  return res
}
