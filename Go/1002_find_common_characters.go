func eliminateChars(charMap map[string]int, word string) map[string]int {
  res := make(map[string]int)
  for _, char := range word {
    if charMap[string(char)] > 0 {
      charMap[string(char)]--
      res[string(char)]++
    }
  }

  return res
}

func commonChars(words []string) []string {
  firstMap := make(map[string]int)
  for _, char := range words[0] {
    firstMap[string(char)]++
  }

  charMap := firstMap
  for _, word := range words {
    charMap = eliminateChars(charMap, word)
  }

  res := []string{}
  fmt.Println(charMap)
  for char, v := range charMap {
     for {
      if v <= 0 {
        break
      }

      res = append(res, char)
      v--
    }
  }

  return res
}
