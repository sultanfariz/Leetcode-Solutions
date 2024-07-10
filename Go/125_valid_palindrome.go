func isPalindrome(s string) bool {
  // remove the non-alpha char
  newStr := []rune{}
  for _, char := range s {
    // remove if char ascii value not in alphabet range
    if (char >= 48 && char <= 57) || (char >= 97 && char <= 122) {
      newStr = append(newStr, char)
    }
    if (char >= 65 && char <=90) {
      char = char+32
      newStr = append(newStr, char)
    }
  }

  if len(newStr) <= 1 {
    return true
  }

  first, second := 0, len(newStr)-1
  for i:=0; i<=len(newStr)-1; i++ {
    if newStr[first] != newStr[second] {
      return false
    }
    if first >= second {
      return true
    }

    first++
    second--
  }

  return false
}
