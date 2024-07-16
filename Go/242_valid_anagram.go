func isAnagram(s string, t string) bool {
  if len(s) != len(t) {
    return false
  }

  charMap1, charMap2 := make(map[byte]int), make(map[byte]int)
  for i, v := range s {
    charMap1[v]++
    charMap2[t[i]]++
  }

  for k, v := range charMap1 {
    if v != charMap2[k] {
      return false
    }
  }

  return true
}
