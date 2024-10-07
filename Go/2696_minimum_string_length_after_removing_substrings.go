func minLength(s string) int {
  for i, char := range s {
    if i == 0 { continue }

    str := string(char)
    if str == "B" && string(s[i-1]) == "A" {
      return minLength(s[:i-1] + s[i+1:])
    }
    
    if str == "D" && string(s[i-1]) == "C" {
      return minLength(s[:i-1] + s[i+1:])
    }
  }  

  return len(s)
}
