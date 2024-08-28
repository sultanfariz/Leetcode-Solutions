func strStr(haystack string, needle string) int {
  for i, char := range haystack {
    if string(char) == string(needle[0]) {
      for j := range needle {
        if i+j >= len(haystack) { return -1 }

        if haystack[i+j] != needle[j] {
          break
        }
        if j == len(needle)-1 {
          return i
        }
      }
    }
  }

  return -1
}
