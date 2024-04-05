func makeGood(s string) string {
  for i, char := range s {
    fmt.Println(s)
    if i == len(s)-1 {
      return s
    }
    charStr := string(char)
    nextChar := s[i+1]
    if (charStr == string(nextChar+32)) || (charStr == string(nextChar-32)) {
      s = s[:i]+s[i+2:]
      return makeGood(s)
    }
  }
  return s
}
