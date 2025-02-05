func areAlmostEqual(s1 string, s2 string) bool {
  // create char maps to store position
  charMap1 := map[string]int{}
  charMap2 := map[string]int{}

  // if those string contain different chars, return false
  for i := range s1 {
    charMap1[string(s1[i])]++
    charMap2[string(s2[i])]++
  }
  for k, v1 := range charMap1 {
    v2, _ := charMap2[k]
    if v1 != v2 {
      return false
    }
  }

  diffCount := 0
  for i := range s1 {
    if s1[i] != s2[i] {
      diffCount++
    }

    if diffCount > 2 {
      return false
    }
  }

  return true
}
