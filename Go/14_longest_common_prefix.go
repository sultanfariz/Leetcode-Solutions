func longestCommonPrefix(strs []string) string {
  res := ""  
  for i, char := range strs[0] {
    for _, str := range strs {
      if i >= len(str) || string(char) != string(str[i]) {
        return res
      }
    }
    res += string(char)
  }

  return res
}
