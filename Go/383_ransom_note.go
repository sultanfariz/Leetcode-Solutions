func canConstruct(ransomNote string, magazine string) bool {
  magazines := make(map[rune]int)
  for _, char := range magazine {
    magazines[char]++
  }

  for _, char := range ransomNote {
    v, ok := magazines[char]
    if !ok || v == 0 {
      return false
    }

    magazines[char]--
  }

  return true
}
