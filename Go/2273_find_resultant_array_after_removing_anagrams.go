func removeAnagrams(words []string) []string {
  res := []string{}
  curr := ""
  for _, word := range words {
    if isAnagram(word, curr) {
      continue
    } 
    curr = word
    res = append(res, curr)
  }

  return res
}

func isAnagram(str1, str2 string) bool {
  if len(str1) != len(str2) {
    return false
  }

  charMap1, charMap2 := make(map[rune]int), make(map[rune]int)
  for _, v := range str1 {
    charMap1[v]++
  }
  for _, v := range str2 {
    charMap2[v]++
  }

  for k, _ := range charMap1 {
    if charMap1[k] != charMap2[k] {
      return false
    }
  }

  return true
}
