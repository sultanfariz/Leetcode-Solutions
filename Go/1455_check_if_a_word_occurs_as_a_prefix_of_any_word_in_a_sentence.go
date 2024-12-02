func isPrefixOfWord(sentence string, searchWord string) int {
  word := 1
  counter := 0
  isPrefix, isSimilar := true, false

  for _, char := range sentence {
    strChar := string(char)

    if isSimilar && string(searchWord[counter]) == strChar {
      if counter >= len(searchWord) - 1 {
        return word
      }
      counter++
      continue
    } else {
      isSimilar = false
      counter = 0
    }

    if strChar == " " {
      word++
      isPrefix = true
      continue
    }

    if isPrefix && string(searchWord[0]) == strChar {
      isSimilar = true
      counter++
      if counter > len(searchWord) - 1 {
        return word
      }
    }

    isPrefix = false
  } 

  return -1
}
